import 'dart:ffi';

import 'package:alwaysvisa/components/custom_dialogBox.dart';
import 'package:alwaysvisa/controllers/auth_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class RegistrationProvider extends ChangeNotifier {
//firebase auth instance
  FirebaseAuth auth = FirebaseAuth.instance;
  var _isObscure = true;
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;

//get obscure state
  bool get isObscure => _isObscure;

//get loading state
  bool get isLoading => _isLoading;

  //get firstname controller
  TextEditingController get firstnameController => _firstname;

  //get lastname controller
  TextEditingController get lastnameController => _lastname;

  //get email controller
  TextEditingController get emailController => _email;

  //get password controller
  TextEditingController get passwordController => _password;

  //change obscure state
  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  //validation Function
  bool inputValidation() {
    var isValid = false;
    if (_firstname.text.isEmpty ||
        _lastname.text.isEmpty ||
        _email.text.isEmpty ||
        _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  //registration function
  Future<void> startRegister(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);
        await AuthController().registerUser(context, _firstname.text,
            _lastname.text, _email.text, _password.text);
        setLoading();
      } else {
        setLoading();
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'Incorrect Information',
          'Please enter correct Information',
        );
      }
    } catch (e) {
      setLoading();
      Logger().e(e);
    }
  }

  //change loading state
  void setLoading([bool val = false]) {
    _isLoading = val;
    notifyListeners();
  }
}
