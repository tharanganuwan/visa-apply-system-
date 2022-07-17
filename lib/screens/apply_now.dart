import 'package:alwaysvisa/components/custom_button.dart';
import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/components/custome_textfield.dart';
import 'package:alwaysvisa/models/applicant_model.dart';
import 'package:alwaysvisa/models/genarator_model.dart';
import 'package:alwaysvisa/providers/appication_provider.dart';
import 'package:alwaysvisa/screens/form.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplyNow extends StatefulWidget {
  ApplyNow({
    Key? key,
    this.count = 100,
    required this.gModel,
  }) : super(key: key);
  int count;
  GenatorModel? gModel;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ApplicationPrivider>(context, listen: false)
            .applicanttype),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FadeInRight(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                AForm(),
                Consumer<ApplicationPrivider>(
                  builder: (context, value, child) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(9),
                        color: (value.appicationCount == 0)
                            ? Colors.red
                            : Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (value.appicationCount == 0)
                                ? CustomText(
                                    textAlign: TextAlign.left,
                                    text: 'Mobile Number',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                : SizedBox(),
                            (value.appicationCount == 0)
                                ? CustomTextField(
                                    hintText: 'Enter Your Number',
                                    controller: value.mobileNumberController,
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                            (value.appicationCount == 0)
                                ? CustomText(
                                    textAlign: TextAlign.left,
                                    text: 'Contact Email',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                : SizedBox(),
                            (value.appicationCount == 0)
                                ? CustomTextField(
                                    hintText: 'Enter Your Contact Email',
                                    controller: value.contactEmailController,
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                            (value.appicationCount == 0)
                                ? CustomText(
                                    text: 'Arrival Date',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                : SizedBox(),
                            (value.appicationCount == 0)
                                ? GestureDetector(
                                    onTap: () async {
                                      DateTime date = DateTime(2022, 12, 04);
                                      DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2022),
                                        firstDate: DateTime(2010),
                                        lastDate: DateTime(2048),
                                      );

                                      setState(() {
                                        if (newDate != null) {
                                          value.setcheckArriveDate(
                                              date.year.toString() +
                                                  "/" +
                                                  date.month.toString() +
                                                  "/" +
                                                  date.day.toString());
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: (value.checkEssureDate)
                                              ? value.arriveDate.toString()
                                              : "Select Date",
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onTap: () {
                          if (widget.count == 100) {
                            GenatorModel model =
                                value.setGenratorDetailsModel();
                            value.setAppicationType();
                            UtilFunction.navigateTo(
                                context,
                                ApplyNow(
                                  count: value.appicationCount,
                                  gModel: model,
                                ));
                          } else if (value.appicationCount > 0) {
                            value.setAppicationType();
                            GenatorModel model =
                                value.setApplicantDetailsModel(widget.gModel);

                            UtilFunction.navigateTo(
                                context,
                                ApplyNow(
                                  count: value.appicationCount,
                                  gModel: model,
                                ));
                          } else {
                            GenatorModel finalGmodel =
                                value.setApplicantDetailsModel(widget.gModel);

                            ///////////////////////////////////////
                            //////////////////////////////////

                            print(finalGmodel.firstname);
                            for (int i = 0;
                                i < finalGmodel.appcationmodellist!.length;
                                i++) {
                              print(
                                  finalGmodel.appcationmodellist![i].firstname);
                              print(finalGmodel
                                  .appcationmodellist![i].nationality);
                            }
                            /////////////////////////////////////////
                            ///////////////////////////////
                            ///
                            ///
                            ///

                          }
                          value.setAppicationCount();
                        },
                        text: (value.appicationCount == 0) ? 'Submit ' : 'Next',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
