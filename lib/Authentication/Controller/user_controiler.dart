import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  var currentUser = Rx<User?>(null);
  var userData = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
    currentUser.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(currentUser, _setUserData);
  }

  void _setUserData(User? user) async {
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      userData.value = userDoc.data();
    } else {
      userData.value = null;
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
