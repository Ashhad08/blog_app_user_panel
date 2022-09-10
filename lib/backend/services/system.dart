import 'package:blog_app_user_panel/backend/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../configurations/back_end.dart';
import '../models/blog.dart';

class SystemServices {
  Future createNewUser(UserModel userModel) async {
    DocumentReference _ref = FirebaseFirestore.instance
        .collection('usersCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return await _ref.set(userModel.toJson());
  }

  Stream<List<BlogModel>> fetchAllBlogs() {
    return BackEndConfigs.kBlogCollection.snapshots().map((myBlogsList) =>
        myBlogsList.docs
            .map((singleBlog) => BlogModel.fromJson(singleBlog.data()))
            .toList());
  }
}
