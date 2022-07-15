import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/screens/about_screen.dart';
import 'package:alwaysvisa/screens/checkVisaStatus_screen.dart';
import 'package:alwaysvisa/screens/contact_screen.dart';
import 'package:alwaysvisa/screens/news_updated_screen.dart';
import 'package:alwaysvisa/screens/notification_screen.dart';
import 'package:alwaysvisa/screens/profile_screen.dart';
import 'package:alwaysvisa/screens/visalis_screen.dart';
import 'package:alwaysvisa/utils/app_colors.dart';
import 'package:alwaysvisa/utils/constant.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 12, 5, 70),
          centerTitle: true,
          elevation: 4,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.pink,
                ));
          }),
        ),
        drawer: ProfileScreen(),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Stack(children: [
                Container(
                  height: size.height / 2.3,
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                UpperSection(),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Quick Links',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      UtilFunction.navigateTo(context, VisaListScreen());
                    },
                    child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.list_alt_outlined,
                                size: 40,
                                color: kblack,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'Apply For Visa',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kblack,
                            )
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      UtilFunction.navigateTo(context, CheckVisaStatus());
                    },
                    child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.library_add_check_outlined,
                                size: 40,
                                color: kblack,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'Check Visa Status',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kblack,
                            )
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Image.asset(
                    Constants.imageAssets(
                      'logo.jpg',
                    ),
                  ),
                ),
                CustomText(
                  text: "ALWAYS VISA",
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: Icons.send,
                  text: 'My UAE Visa',
                  ontap: () {
                    UtilFunction.navigateTo(context, VisaListScreen());
                  },
                ),
                CustomIconButton(
                    icon: Icons.checklist_outlined,
                    text: 'Check Visa Status',
                    ontap: () {
                      UtilFunction.navigateTo(context, CheckVisaStatus());
                    }),
                CustomIconButton(
                  icon: Icons.notifications,
                  text: 'Notifications',
                  ontap: () {
                    UtilFunction.navigateTo(context, NotificationScreen());
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: Icons.edit_calendar_outlined,
                  text: 'About Us',
                  ontap: () {
                    UtilFunction.navigateTo(context, AboutScreen());
                  },
                ),
                CustomIconButton(
                  icon: Icons.stacked_bar_chart,
                  text: 'News & Updates',
                  ontap: () {
                    UtilFunction.navigateTo(context, NewsUpdatesScreen());
                  },
                ),
                CustomIconButton(
                  icon: Icons.contact_mail_outlined,
                  text: 'Contact Us',
                  ontap: () {
                    UtilFunction.navigateTo(context, ContactScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.ontap,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 110,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  icon,
                  size: 40,
                  color: kwhite,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: text,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: kwhite,
              )
            ],
          )),
    );
  }
}
