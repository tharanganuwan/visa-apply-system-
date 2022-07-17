import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/providers/appication_provider.dart';
import 'package:alwaysvisa/screens/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplyNow extends StatefulWidget {
  ApplyNow({
    Key? key,
  }) : super(key: key);

  @override
  State<ApplyNow> createState() => _ApplyNowState();
}

// Future sendEmail() async {
//   final serviceId = 'service_rp38611';
//   final templateId = 'template_j3hpazi';
//   final userId = '8Oq0drGqIM-XZduJK';

//   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
//   final response = await http.post(url,
//       headers: {
//         'origin': 'http://localhost',
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'service_id': serviceId,
//         'template_id': templateId,
//         'user_id': userId,
//         'template_params': {
//           "name": nameController.text,
//           "subject": subjectControler.text,
//           "mobile": mobileController.text,
//           "email": emailController.text,
//           "description": descriptionController.text,
//         }
//       }));
//   return response.statusCode;
// }

class _ApplyNowState extends State<ApplyNow> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((Provider.of<ApplicationPrivider>(context, listen: false)
                    .appicationCount >
                0)
            ? 'Guarantor Details'
            : 'Application for Adult'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              AForm(),
              CustomButton(
                  onTap: () {
                    setState(() {
                      if (i == 1) {
                        Provider.of<ApplicationPrivider>(context, listen: false)
                            .setGenaraterDetails();
                      }
                      i--;
                      if ((Provider.of<ApplicationPrivider>(context,
                                  listen: false)
                              .appicationCount >
                          0)) {
                        Provider.of<ApplicationPrivider>(context, listen: false)
                            .setAppicationCount();
                        Provider.of<ApplicationPrivider>(context, listen: false)
                            .setApplicationForm(true);
                      } else {
                        //sendEmail();
                      }
                    });
                  },
                  text:
                      (Provider.of<ApplicationPrivider>(context, listen: false)
                                  .appicationCount ==
                              0)
                          ? 'Contact Now'
                          : 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
