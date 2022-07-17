import 'package:alwaysvisa/models/applicant_model.dart';

class GenatorModel {
  late String? id;
  late int? adults;
  late int? children;
  late int? infants;
  late String? firstname;
  late String? middlename;
  late String? lastname;
  late String? gender;
  late String? nationality;
  late var document;
  late String passportnumber;
  late String issuredate;
  late String expirydate;
  late String issureplace;
  late String? companyname;
  late String? relationwithpassenger;
  late String? contactnumber1;
  late String? contactnumber2;
  late String? email;
  late bool? isanapplicant;
  late List<ApplicantModel>? appcationmodellist = [];
  late String? mobileNumber;
  late String? contactEmail;
  late String? arrivalDate;

  GenatorModel({
    required this.id,
    required this.adults,
    required this.children,
    required this.infants,
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.gender,
    required this.nationality,
    required this.passportnumber,
    required this.issuredate,
    required this.expirydate,
    required this.issureplace,
    required this.document,
    required this.companyname,
    required this.relationwithpassenger,
    required this.contactnumber1,
    required this.contactnumber2,
    required this.email,
    required this.isanapplicant,
    required this.appcationmodellist,
    required this.mobileNumber,
    required this.contactEmail,
    required this.arrivalDate,
  });
  // GenatorModel.fromMap(Map map) {
  //   id = map['uid'];
  //   adults = map['adults'];
  //   children = map['children'];
  //   infants = map['infants'];
  //   firstname = map['firstname'];
  //   middlename = map['middlename'];
  //   lastname = map['lastname'];
  //   gender = map["gender"];
  //   nationality = map['nationality'];
  //   passportnumber = map['passportnumber'];
  //   issuredate = map['issuredate'];
  //   expirydate = map['expirydate'];
  //   issureplace = map['issureplace'];
  //   document = map['documet'];
  //   companyname = map['companyname'];
  //   relationwithpassenger = map['relationwithpassenger'];
  //   contactnumber1 = map['contactnumber1'];
  //   contactnumber1 = map['contactnumber2'];
  //   email = map['email'];
  //   isanapplicant = map['isanapplicant'];
  //   appcationmodellist = map['appcationmodellist'];
  // }
}
