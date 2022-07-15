import 'package:alwaysvisa/controllers/db_controller.dart';
import 'package:alwaysvisa/models/user_model.dart';
import 'package:alwaysvisa/models/user_model.dart';
import 'package:alwaysvisa/screens/home_screen.dart';
import 'package:alwaysvisa/screens/login_screen/login_screen.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  DatabaseController _databaseController = DatabaseController();

  late UserModel _userModel;

  UserModel get userModel => _userModel;

  //intialized and check whether the user sign in or not
  void initializeUser(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().i('User is currntly signed out!');
        UtilFunction.navigateTo(context, LogingScreen());
      } else {
        fetchSingleUser(user.uid);
        UtilFunction.navigateTo(context, HomeScreen());
        Logger().i('User is sign in!');
      }
    });
  }

  //sign out
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    UtilFunction.navigateTo(context, LogingScreen());
  }

  //get user data
  //get user data from database contorller
  Future<void> fetchSingleUser(String id) async {
    _userModel = (await _databaseController.getUserdata(id))!;
    //set already added cart items when fetching userdata

    notifyListeners();
  }
}
