import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String id;
  late String name;
  late String email;
  late String username; // Add username field

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
  });

  User.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    id = snapshot.id;
    name = snapshot['name'];
    email = snapshot['email'];
    username = snapshot['username']; // Update fromSnapshot to include username
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'username': username,
    };
  }
}
