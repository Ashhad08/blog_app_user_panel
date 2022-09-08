import 'package:blog_app_user_panel/backend/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SystemServices {
  Future createNewUser(UserModel userModel) async {
    DocumentReference _ref = FirebaseFirestore.instance
        .collection('usersCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return await _ref.set(userModel.toJson());
  }
}
