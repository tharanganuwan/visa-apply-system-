import 'package:alwaysvisa/controllers/db_controller.dart';
import 'package:alwaysvisa/screens/home_screen.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../components/custom_dialogBox.dart';

class AuthController {
  //instance created
  FirebaseAuth auth = FirebaseAuth.instance;

  //User registration function
  Future<void> registerUser(BuildContext context, String firstname,
      String lastname, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user!.uid.isNotEmpty) {
        await DatabaseController()
            .saveUserData(firstname, lastname, email, userCredential.user!.uid);
      }

      DialogBox().dialogBox(
        context,
        DialogType.SUCCES,
        'User Account Created',
        'Now you can login',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The password provided is too weak.',
          'Please enter valid password',
        );
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The account already exists for that email.',
          'Please enter valid email',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  //User registration function
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential usercredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (usercredential.user != null) {
        UtilFunction.navigateTo(context, HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'No user found for that email',
          'Please enter valid email',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'wrong password provide for that user.',
          'Please enter valid password',
        );
      }
    }
  }

  //send password reset email function
  Future<void>? sendPasswordResetEmail(
      BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Invalid Emai') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'Invalid Email',
          'Please enter valid email',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'wrong password provide for that user.',
          'Please enter valid password',
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
