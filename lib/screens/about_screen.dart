import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Us'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            CustomText(
              text:
                  "Establish In 2022,'LEGIT' Strives To Get Justice For Their Clients.We Believe In a Good And Honest Fight,And We Will Not Stop At Anything.",
              textOverflow: TextOverflow.clip,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            SizedBox(
              height: 30,
            ),
            CustomText(
              text: "Address",
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text:
                  "The Mclaren Building,46 The Priory Queensway,Birmingham,England,B4 7LR",
              textOverflow: TextOverflow.clip,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "Telephone Number",
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "+20 109 402 0548",
              color: Colors.red,
              textOverflow: TextOverflow.clip,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "Telephone Number",
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "+44 736 160 8925",
              color: Colors.red,
              textOverflow: TextOverflow.clip,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "Email",
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "info@alwaysvisa.com",
              textOverflow: TextOverflow.clip,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
