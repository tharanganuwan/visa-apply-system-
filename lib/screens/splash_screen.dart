import 'package:alwaysvisa/providers/auth/user_provider.dart';
import 'package:alwaysvisa/screens/home_screen.dart';
import 'package:alwaysvisa/screens/login_screen/login_screen.dart';
import 'package:alwaysvisa/utils/app_colors.dart';
import 'package:alwaysvisa/utils/constant.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Provider.of<UserProvider>(context, listen: false)
            .initializeUser(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kwhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Bounce(
              child: Container(
                width: size.width,
                height: 100,
                child: Image.asset(
                  Constants.imageAssets(
                    'logo.jpg',
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
