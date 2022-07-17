import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/components/custome_textfield.dart';
import 'package:alwaysvisa/providers/appication_provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AForm extends StatelessWidget {
  const AForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationPrivider>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'First Name',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          CustomTextField(
            hintText: 'Enter first Name',
            controller: value.fnameController,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Middle Name',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          CustomTextField(
            hintText: 'Enter Middle Name',
            controller: value.mnameController,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Last Name',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          CustomTextField(
            hintText: 'Enter Last Name',
            controller: value.lnameController,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Gender',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          DropdownButtonFormField(
            //value: value.getSelectValue,
            hint: Text("   select"),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            items: value.genderlist
                .map((e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ))
                .toList(),
            onChanged: (val) {
              value.setGender(val.toString());
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Nationality',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          CountryCodePicker(
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            alignLeft: true,
            onChanged: (x) {
              value.setNationality(x.name.toString());
            },
          ),
          SizedBox(
            height: 10,
          ),
          (value.appicationform)
              ? CustomText(
                  text: 'Passport Number',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (value.appicationform)
              ? CustomTextField(
                  hintText: 'Enter Passport Number ',
                  controller: value.passportController,
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (value.appicationform)
              ? CustomText(
                  text: 'Essue Date',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (value.appicationform)
              ? GestureDetector(
                  onTap: () async {
                    DateTime date = DateTime(2022, 12, 04);
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2022),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2048),
                    );
                    if (newDate != null) {
                      value.setEssuredate(date.year.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.day.toString());
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomText(
                        text: (value.checkEssureDate)
                            ? value.essuredate.toString()
                            : "Select Date",
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (value.appicationform)
              ? CustomText(
                  text: 'Expiry Date',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (value.appicationform)
              ? GestureDetector(
                  onTap: () {
                    Future<DateTime?> newDate = showDatePicker(
                      context: context,
                      initialDate: DateTime(2022),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2048),
                    );
                    if (newDate != null) {
                      DateTime date = DateTime(2022, 12, 04);
                      value.setEssuredate(date.year.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.day.toString());
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomText(
                        text: (value.essuredate == null)
                            ? "Select Date"
                            : value.essuredate.toString(),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (value.appicationform)
              ? CustomText(
                  text: 'Issue Place',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (value.appicationform)
              ? CountryCodePicker(
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  alignLeft: true,
                  onChanged: (x) {},
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Company Name',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? CustomTextField(
                  hintText: 'Enter Company Name',
                  controller: value.companynameController,
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Relationship with Passenger',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? CustomTextField(
                  hintText: 'Enter Relationship with Passenger Name',
                  controller: value.relationwithpController,
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Contact number 1',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? CustomTextField(
                  hintText: 'Enter Contact number Name',
                  controller: value.contactNumberController1,
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Contact number 2',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? CustomTextField(
                  hintText: 'Enter Contact number Name',
                  controller: value.contactNumberController2,
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Email',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? CustomTextField(
                  hintText: 'Enter Email Name',
                  controller: value.emailController,
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Select Applicants Adults',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? DropdownButtonFormField(
                  value: 1,
                  hint: Text("   select"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  items: value.numberlist1
                      .map((e) => DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    value.setAdults(int.parse(val.toString()));
                  },
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Select Applicants Children',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? DropdownButtonFormField(
                  value: 0,
                  hint: Text("   select"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  items: value.numberlist2
                      .map((e) => DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    value.setchilder(int.parse(val.toString()));
                  },
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          (!value.appicationform)
              ? CustomText(
                  text: 'Select Applicants Infants',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : SizedBox(),
          (!value.appicationform)
              ? DropdownButtonFormField(
                  value: 0,
                  hint: Text("   select"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  items: value.numberlist2
                      .map((e) => DropdownMenuItem(
                            child: Text(e.toString()),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    value.setinfants(int.parse(val.toString()));
                  },
                )
              : SizedBox(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
