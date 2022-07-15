import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/components/custom_dialogBox.dart';
import 'package:alwaysvisa/components/custom_loader.dart';
import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/components/custome_textfield.dart';
import 'package:alwaysvisa/controllers/auth_controller.dart';
import 'package:alwaysvisa/screens/login_screen/login_screen.dart';
import 'package:alwaysvisa/utils/app_colors.dart';
import 'package:alwaysvisa/utils/constant.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgottenPasswordScreen extends StatefulWidget {
  const ForgottenPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgottenPasswordScreen> createState() =>
      _ForgottenPasswordScreenState();
}

class _ForgottenPasswordScreenState extends State<ForgottenPasswordScreen> {
  var _isObscure = true;
  final _email = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
        ),
      ),
      backgroundColor: kwhite,
      body: SafeArea(
        child: FadeInLeft(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'Password Reset Email',
                      controller: _email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: size.width / 2.2,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                UtilFunction.navigateTo(
                                    context, LogingScreen());
                              },
                              child: Text('Cancel'),
                            )),
                        SizedBox(
                            width: size.width / 2.2,
                            height: 50,
                            child: isLoading
                                ? Custom_loader()
                                : ElevatedButton(
                                    onPressed: () async {
                                      if (inputValidation()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await AuthController()
                                            .sendPasswordResetEmail(
                                                context, _email.text);
                                        setState(() {
                                          isLoading = false;
                                        });
                                      } else {
                                        DialogBox().dialogBox(
                                          context,
                                          DialogType.ERROR,
                                          'Incorrect Email',
                                          'Please enter correct email',
                                        );
                                      }
                                    },
                                    child: Text('Submit'))),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
