import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  Rx<User?> _firebaseUser = Rx<User?>(null);
  User? get user => _firebaseUser.value;
  RxBool isLoading = false.obs; // Reactive boolean to track loading state

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> signup(
      String name,
      String email,
      String password,
      ) async {
    try {
      isLoading(true); // Set loading to true before signup process

      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // Create a user document in Firestore
        await _createUserFirestore(
          firebaseUser.uid,
          name,
          email,
        );
        // Loading done, set back to false
        isLoading(false);
      } else {
        isLoading(false);
        Get.snackbar(
          'Error',
          'Failed to create user. Please try again later.',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      isLoading(false);
      String errorMessage = 'Error signing up: ${e.toString()}';
      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
  Future<void> sendEmailVerifications() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }
  Future<void> signin(String email, String password) async {
    try {
      isLoading(true); // Set loading to true before signin process

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Loading done, set back to false
      isLoading(false);
    } catch (e) {
      isLoading(false);
      String errorMessage = 'Error signing in: ${e.toString()}';
      throw errorMessage; // Throw error to be caught in UI
    }
  }

  Future<void> _createUserFirestore(
      String userId,
      String name,
      String email,
      ) async {
    try {
      await _usersCollection.doc(userId).set({
        'name': name,
        'email': email,
        // Add other fields as needed
      });
    } catch (e) {
      String errorMessage = 'Error creating user document: ${e.toString()}';
      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      String errorMessage = 'Error signing out: ${e.toString()}';
      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
