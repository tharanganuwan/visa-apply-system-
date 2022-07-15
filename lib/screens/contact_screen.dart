import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/components/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color.fromARGB(255, 12, 5, 70),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Full Name',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomTextField(
              hintText: 'Enter Full Name',
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Mobile Number',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomTextField(
              hintText: 'Enter Mobile Number',
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Email Address',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomTextField(
              hintText: 'Enter Email Address',
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Subject',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomTextField(
              hintText: 'Enter Subject or Reason for contacting',
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Description',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomTextField(
              hintText: 'Enter Description',
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(onTap: () {}, text: 'Contact Now')
          ],
        ),
      ),
    );
  }
}
