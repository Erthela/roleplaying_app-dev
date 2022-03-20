import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:roleplaying_app/src/bloc/auth/auth_bloc.dart';
import 'package:roleplaying_app/src/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserModel(id: user!.uid, email: user.email, name: user.displayName, photo: user.photoURL);
    }
    catch (e) {
      return null;
    }
  }

  Future registration(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserModel(id: user!.uid, email: user.email, name: user.displayName, photo: user.photoURL);
    }
    catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get currentUser{
    return _firebaseAuth.authStateChanges();
  }
}