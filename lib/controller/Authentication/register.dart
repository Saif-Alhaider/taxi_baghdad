
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void registerUser(
    {required BuildContext context,required FirebaseAuth auth,
    required String email,
    required String password,
    required String username,
    }) async {
  final User? user = (await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((err) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(err.message!)));
  }))
      .user;
  if (user != null) {
    DatabaseReference userInfo =FirebaseDatabase.instance.ref('users/${user.uid}'); 
    Map info = {
      "username":username,
      "email":email
    };
    userInfo.set(info);
  }
}
