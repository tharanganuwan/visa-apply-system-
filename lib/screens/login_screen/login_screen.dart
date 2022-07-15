import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/components/custom_dialogBox.dart';
import 'package:alwaysvisa/components/custom_loader.dart';
import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/components/custome_textfield.dart';
import 'package:alwaysvisa/controllers/auth_controller.dart';
import 'package:alwaysvisa/providers/auth/login_provider.dart';
import 'package:alwaysvisa/screens/login_screen/forgotpassword.dart';
import 'package:alwaysvisa/screens/login_screen/register_screen.dart';
import 'package:alwaysvisa/utils/app_colors.dart';
import 'package:alwaysvisa/utils/constant.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({Key? key}) : super(key: key);

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  Future<bool> initBackButton() async {
    //when in home screen if you try to exit it shows dialog box
    return await showDialog(
          context: context,
          builder: (context) => ElasticIn(
            child: AlertDialog(
              title: CustomText(text: 'Exit App'),
              content: CustomText(text: 'Do you want to really exit an App'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: CustomText(text: 'No')),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: CustomText(text: 'Yes'))
              ],
            ),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: initBackButton,
      child: Scaffold(
        backgroundColor: kwhite,
        body: FadeInLeft(
          child: SingleChildScrollView(child: Consumer<LoginProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Constants.imageAssets(
                          'logo.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      CustomText(
                        text: 'Login',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: kblack,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: value.emailController,
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: value.passwordController,
                        obscureText: value.isObscure,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  value.changeObscure();
                                },
                                icon: Icon(value.isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 69, 67, 67))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          isLoading: value.isLoading,
                          onTap: () async {
                            value.startLogin(context);
                          },
                          text: 'Sign In'),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {
                          UtilFunction.navigateTo(
                              context, ForgottenPasswordScreen());
                        },
                        child: GestureDetector(
                          onTap: () {
                            UtilFunction.navigateTo(
                                context, ForgottenPasswordScreen());
                          },
                          child: CustomText(
                            text: 'Forgot Password',
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have and account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                          TextSpan(
                              text: "Register",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  UtilFunction.navigateTo(
                                      context, RegisterScreen());
                                },
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))
                        ])),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }
}
