class UserModel {
  late String uid;
  late String firstname;
  late String lastname;
  late String email;

  UserModel(
      {required this.uid,
      required this.firstname,
      required this.lastname,
      required this.email});
  UserModel.fromMap(Map map) {
    uid = map['uid'];
    firstname = map['firstname'];
    lastname = map['lastname'];
    email = map['email'];
  }
}
