import 'package:alwaysvisa/models/applicant_model.dart';
import 'package:flutter/cupertino.dart';

class ApplicationPrivider extends ChangeNotifier {
  bool _appicationform = false;
  final _fnameController = TextEditingController();
  final _mnameController = TextEditingController();
  final _lnameController = TextEditingController();
  String? _gender;
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
  int _adults = 0;
  int _children = 0;
  int _infants = 0;
  final _genderlist = ["Male", "Female", "Other"];
  final _numberlist1 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  final _numberlist2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _appicationCount = 1;

  int get appicationCount => _appicationCount;
  bool get appicationform => _appicationform;
  TextEditingController get fnameController => _fnameController;
  TextEditingController get mnameController => _mnameController;
  TextEditingController get lnameController => _lnameController;
  String? get gender => _gender;
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

  void setAppicationCount() {
    _appicationCount = _appicationCount - 1;
    print(_appicationCount);
  }

  Future<void> setGenaraterDetails() async {
    _appicationCount = _adults + _children + _infants;
    print(_appicationCount);
  }

  // List<ApplicantModel> o = [];

  // Future<ApplicantModel> setAGenaratorDetails() async {
  //   ApplicantModel applicationModel = ApplicantModel(
  //     id: "a",
  //     firstname: _fnameController.text,
  //     middlename: _mnameController.text,
  //     lastname: _lnameController.text,
  //     gender: _gender.toString(),
  //     nationality: _nationality.toString(),
  //     passportnumber: _passportController.text,
  //     issuredate: _essuredate.toString(),
  //     expirydate: _expiredate.toString(),
  //     issureplace: essureplace.toString(),
  //     applicanttype: "Gurnator",
  //   );

  //   return applicationModel;
  // }

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

  Future<void> setApplicationForm(bool num) async {
    _appicationform = num;
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
    print(_checkEssureDate);
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
