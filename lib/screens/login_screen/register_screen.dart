import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/components/custom_dialogBox.dart';
import 'package:alwaysvisa/components/custom_loader.dart';
import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/components/custome_textfield.dart';
import 'package:alwaysvisa/controllers/auth_controller.dart';
import 'package:alwaysvisa/providers/auth/registration_provider.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
        ),
      ),
      backgroundColor: kwhite,
      body: SafeArea(
        child: FadeInLeft(
          child: SingleChildScrollView(child: Consumer<RegistrationProvider>(
            builder: (context, value, child) {
              return Padding(
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
                        hintText: 'First Name',
                        controller: value.firstnameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: 'Last Name',
                        controller: value.lastnameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: 'Email',
                        controller: value.emailController,
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
                            value.startRegister(context);
                          },
                          text: 'Sign In'),
                      SizedBox(
                        height: 20,
                      ),
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
