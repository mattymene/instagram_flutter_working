import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance; // to authenticate the user
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // to save in the database our new user

// sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file, // list of files
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        // add user to our database
        // (we are telling firebase/firestore to create a new collection called 'users' with some specs (if already existing will be overridden)
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });

        /// NB: the .set method permits to set the username of our collection's new-user equal to the cred.user!.uid, doing so we can get easily access inside our app to that uid connected to the profile stored in the firebase collection
        ///     the .add method instead doesn't have this feature, so the 2 id will be DIFFERENT
        /*
        await _firestore.collection('users').add({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });

         */

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
