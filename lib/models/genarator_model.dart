import 'package:alwaysvisa/models/applicant_model.dart';

class GenatorModel {
  late String id;
  late int adults;
  late int children;
  late int infants;
  late String firstname;
  late String middlename;
  late String lastname;
  late String gender;
  late String nationality;
  late String passportnumber;
  late String issuredate;
  late String expirydate;
  late String issureplace;
  late var document;

  late String? companyname;
  late String? relationwithpassenger;
  late String? contactnumber1;
  late String? contactnumber2;
  late String? email;
  late bool? isanapplicant;
  late List<ApplicantModel>? appcationmodellist;

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
    this.document,
    this.companyname,
    this.relationwithpassenger,
    this.contactnumber1,
    this.contactnumber2,
    this.email,
    this.isanapplicant,
    this.appcationmodellist,
  });
  GenatorModel.fromMap(Map map) {
    id = map['uid'];
    adults = map['adults'];
    children = map['children'];
    infants = map['infants'];
    firstname = map['firstname'];
    middlename = map['middlename'];
    lastname = map['lastname'];
    gender = map["gender"];
    nationality = map['nationality'];
    passportnumber = map['passportnumber'];
    issuredate = map['issuredate'];
    expirydate = map['expirydate'];
    issureplace = map['issureplace'];
    document = map['documet'];
    companyname = map['companyname'];
    relationwithpassenger = map['relationwithpassenger'];
    contactnumber1 = map['contactnumber1'];
    contactnumber1 = map['contactnumber2'];
    email = map['email'];
    isanapplicant = map['isanapplicant'];
    appcationmodellist = map['appcationmodellist'];
  }
}
