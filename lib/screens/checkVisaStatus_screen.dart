import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/components/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckVisaStatus extends StatefulWidget {
  const CheckVisaStatus({Key? key}) : super(key: key);

  @override
  State<CheckVisaStatus> createState() => _CheckVisaStatusState();
}

class _CheckVisaStatusState extends State<CheckVisaStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Check Visa Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "My UAE Visa",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: "powerd by AlwaysVisa",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text:
                  "To check your visa status enter your application number here",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Application Number",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Enter visa application number',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {},
              text: 'Check Now',
            )
          ],
        ),
      ),
    );
  }
}
