import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusables/navigators.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  //firebase auth change stream
  Stream<User?> get authStateChanged {
    return auth.authStateChanges();
  }

  User? currentUser() {
    return auth.currentUser;
  }

  //Firebase email password login
  Future<UserCredential?> signInUsingEmail(String email, String password) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Error - $e');
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      } else {
        throw 'Unable to reach our backend';
      }
    }
  }

  Future<UserCredential?> signUpUsingEmail(Map<String, dynamic> signupData) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupData['email'],
        password: signupData['password'],
      );
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(signupData['userName']);
        await userCredential.user!.sendEmailVerification();
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'Email already in use, please try other';
      } else if (e.code == 'weak-password') {
        throw 'Password provided is weak.';
      } else if (e.code == 'invalid-email') {
        throw 'Email is not valid';
      } else {
        throw 'Unable to reach our backend';
      }
    }
  }

  //logout current user
  Future signOut(BuildContext context, String callerPage) async {
    debugPrint("auth_services.dart >> signOut called from page >> $callerPage");
    return Future.wait([
      closeAllDialogs(context),
      FirebaseAuth.instance.signOut(),
    ]);
  }
}
