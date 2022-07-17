class ApplicantModel {
  late String id;
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
  late String applicanttype;

  ApplicantModel({
    required this.id,
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
    required this.applicanttype,
  });
  ApplicantModel.fromMap(Map map) {
    id = map['uid'];
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
    applicanttype = map['applicanttype'];
  }
}
