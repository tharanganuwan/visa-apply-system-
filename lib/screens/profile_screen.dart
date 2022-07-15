import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/models/user_model.dart';
import 'package:alwaysvisa/providers/auth/user_provider.dart';
import 'package:alwaysvisa/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.cyan,
        child: Consumer<UserProvider>(
          builder: (context, value, child) {
            return ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Column(
                  children: [
                    Text(
                      'Account Details',
                      style: TextStyle(
                          fontSize: 25,
                          color: kwhite,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: kwhite,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      value.userModel.email,
                      style: TextStyle(
                          fontSize: 18,
                          color: kwhite,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value.userModel.firstname,
                          style: TextStyle(
                              fontSize: 18,
                              color: kwhite,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          value.userModel.lastname,
                          style: TextStyle(
                              fontSize: 18,
                              color: kwhite,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    CustomButton(onTap: () {}, text: 'Change Paswords'),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        onTap: () {
                          Provider.of<UserProvider>(context, listen: false)
                              .logout(context);
                        },
                        text: 'Logout'),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(onTap: () {}, text: 'App Version'),
                  ],
                ))
              ],
            );
          },
        ));
  }
}
