import 'package:blog_app_user_panel/backend/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../configurations/back_end.dart';
import '../models/blog_model.dart';
import '../models/event_model.dart';
import '../models/program_model.dart';

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

  Stream<List<ProgramModel>> fetchAllPrograms() {
    return BackEndConfigs.kProgramsCollection.snapshots().map((myBlogsList) =>
        myBlogsList.docs
            .map((singleBlog) => ProgramModel.fromJson(singleBlog.data()))
            .toList());
  }

  Stream<List<EventModel>> fetchAllUpcomingEvents() {
    return BackEndConfigs.kEventsCollection
        .where(
          "eventDate",
          isGreaterThanOrEqualTo: DateTime.now(),
        )
        .snapshots()
        .map((myBlogsList) => myBlogsList.docs
            .map((singleBlog) => EventModel.fromJson(singleBlog.data()))
            .toList());
  }

  Stream<List<EventModel>> fetchAllPastEvents() {
    return BackEndConfigs.kEventsCollection
        .where(
          "eventDate",
          isLessThan: DateTime.now(),
        )
        .snapshots()
        .map((myBlogsList) => myBlogsList.docs
            .map((singleBlog) => EventModel.fromJson(singleBlog.data()))
            .toList());
  }
}
