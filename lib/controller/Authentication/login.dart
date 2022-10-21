import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../view/Home/home_main.dart';

void loginUser({
  required BuildContext context,
  required FirebaseAuth auth,
  required String email,
  required String password,
}) async {
  final User? user = (await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .catchError((err) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(err.message!)));
  }))
      .user;
  if (user != null) {
    // check if user has info in db
    DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users/${user.uid}');
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
      return Home();
    },), (route) => false);

    userRef.once().then((dbRef) {
      if (dbRef.snapshot.value != null) {
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(dbRef.snapshot.value.toString())));
      }
    });
  }
}
