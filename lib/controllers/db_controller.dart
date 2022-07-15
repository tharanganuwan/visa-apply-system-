import 'package:alwaysvisa/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseController {
  //Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //create a collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //save user information
  Future<void> saveUserData(
      String firstname, String lastname, String email, String uid) {
    return users
        .doc(uid)
        .set({
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'uid': uid
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //get user data
  Future<UserModel?> getUserdata(String id) async {
    try {
      DocumentSnapshot snapshot = await users.doc(id).get();
      Logger().i(snapshot.data());
      UserModel userModel =
          UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      Logger().d(userModel.firstname);
      return userModel;
    } catch (e) {
      Logger().e(e);
    }
  }
}
