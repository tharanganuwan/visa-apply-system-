import 'package:alwaysvisa/models/applicant_model.dart';
import 'package:alwaysvisa/models/genarator_model.dart';
import 'package:alwaysvisa/providers/auth/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ApplicationPrivider extends ChangeNotifier {
  final _fnameController = TextEditingController();
  final _mnameController = TextEditingController();
  final _lnameController = TextEditingController();
  String? _gender;
  final _age = TextEditingController();
  String? _nationality;
  String? _essuredate;
  String? _expiredate;
  String? _essureplace;
  final _companynameController = TextEditingController();
  final _relationwithpController = TextEditingController();
  final _contactNumberController1 = TextEditingController();
  final _contactNumberController2 = TextEditingController();
  final _emailController = TextEditingController();
  final _passportController = TextEditingController();
  int _adults = 1;
  int _children = 0;
  int _infants = 0;
  final _genderlist = ["Male", "Female", "Other"];
  final _numberlist1 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  final _numberlist2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _appicationCount = 1;
  String _applicanttype = "Guarantor Details";
  final _mobileNumberController = TextEditingController();
  final _contactEmailController = TextEditingController();
  String? _arriveDate;

  TextEditingController get mobileNumberController => _mobileNumberController;
  TextEditingController get contactEmailController => _contactEmailController;
  String? get arriveDate => _arriveDate;
  String get applicanttype => _applicanttype;
  int get appicationCount => _appicationCount;
  TextEditingController get fnameController => _fnameController;
  TextEditingController get mnameController => _mnameController;
  TextEditingController get lnameController => _lnameController;
  String? get gender => _gender;
  TextEditingController get ageController => _age;
  String? get nationality => _nationality;
  String? get essuredate => _essuredate;
  String? get expiredate => _expiredate;
  String? get essureplace => _essureplace;
  TextEditingController get companynameController => _companynameController;
  TextEditingController get relationwithpController => _relationwithpController;
  TextEditingController get contactNumberController1 =>
      _contactNumberController1;
  TextEditingController get contactNumberController2 =>
      _contactNumberController2;
  TextEditingController get emailController => _emailController;
  TextEditingController get passportController => _passportController;
  int? get adults => _adults;
  int? get childer => _children;
  int? get infants => _infants;
  List get genderlist => _genderlist;
  List get numberlist1 => _numberlist1;
  List get numberlist2 => _numberlist2;

  Future<void> addAdditionalDetails(GenatorModel m) async {
    m.mobileNumber = _mobileNumberController.text;
    m.contactEmail = _contactEmailController.text;
    m.arrivalDate = _arriveDate;
  }

  Future<void> setAppicationType() async {
    if (_appicationCount > _children + _infants) {
      _applicanttype = "Audlts Details";
    } else {
      if (_appicationCount > _infants) {
        _applicanttype = "Children Details";
      } else {
        _applicanttype = "Infants Details";
      }
    }
  }

  void setAppicationCount() {
    _appicationCount = _appicationCount - 1;
  }

  Future<void> setGenaraterAppicationCount() async {
    _appicationCount = _adults + _children + _infants;
  }

  GenatorModel setGenratorDetailsModel(String uid) {
    setGenaraterAppicationCount();
    GenatorModel genratorModel = GenatorModel(
      id: uid,
      firstname: _fnameController.text,
      middlename: _mnameController.text,
      lastname: _lnameController.text,
      gender: _gender.toString(),
      nationality: _nationality.toString(),
      passportnumber: _passportController.text,
      expirydate: _expiredate.toString(),
      issuredate: _essuredate.toString(),
      issureplace: _essureplace.toString(),
      document: null,
      adults: _adults,
      children: _children,
      infants: _infants,
      relationwithpassenger: _relationwithpController.text,
      contactnumber1: _contactNumberController1.text,
      contactnumber2: _contactNumberController2.text,
      email: _emailController.text,
      isanapplicant: false,
      appcationmodellist: [],
      companyname: _companynameController.text,
      mobileNumber: _mobileNumberController.text,
      contactEmail: _contactEmailController.text,
      arrivalDate: _arriveDate,
    );

    clearDate();

    return genratorModel;
  }

  void clearDate() {
    _fnameController.clear();
    _mnameController.clear();
    _lnameController.clear();
    _gender = null;
    _age.clear();
    _nationality = null;
    _essuredate = null;
    _expiredate = null;
    _essureplace = null;
    _companynameController.clear();
    _relationwithpController.clear();
    _contactNumberController1.clear();
    _contactNumberController2.clear();
    _emailController.clear();
    _passportController.clear();
  }

  GenatorModel setApplicantDetailsModel(GenatorModel? model) {
    addAdditionalDetails(model!);

    ApplicantModel applicantModel = ApplicantModel(
      id: "b",
      firstname: _fnameController.text,
      middlename: _mnameController.text,
      lastname: _lnameController.text,
      gender: _gender.toString(),
      age: _age.toString(),
      nationality: _nationality.toString(),
      passportnumber: _passportController.text,
      issuredate: _essuredate.toString(),
      expirydate: _expiredate.toString(),
      issureplace: essureplace.toString(),
      document: null,
      applicanttype: _applicanttype.toString(),
    );
    model.appcationmodellist!.add(applicantModel);
    clearDate();
    return model;
  }

  Future<void> setAdults(int num) async {
    _adults = num;
    ChangeNotifier();
  }

  Future<void> setchilder(int num) async {
    _children = num;
    ChangeNotifier();
  }

  Future<void> setinfants(int num) async {
    _infants = num;
    ChangeNotifier();
  }

  Future<void> setGender(String num) async {
    _gender = num;
    ChangeNotifier();
  }

  Future<void> setNationality(String num) async {
    _nationality = num;
    ChangeNotifier();
  }

  bool _checkEssureDate = false;
  bool get checkEssureDate => _checkEssureDate;
  Future<void> setEssuredate(String num) async {
    _essuredate = num;
    _checkEssureDate = true;
    ChangeNotifier();
  }

  bool _checkArriveDate = false;
  bool get checkArriveDate => _checkEssureDate;
  Future<void> setcheckArriveDate(String num) async {
    _arriveDate = num;
    _checkArriveDate = true;
    ChangeNotifier();
  }

  Future<void> setExpiredate(String num) async {
    _expiredate = num;
    ChangeNotifier();
  }

  Future<void> setEssureplacer(String num) async {
    _essureplace = num;
    ChangeNotifier();
  }
}
