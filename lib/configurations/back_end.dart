import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class BackEndConfigs {
  static CollectionReference<Map<String, dynamic>> kUsersCollection =
      FirebaseFirestore.instance.collection('usersCollection');
  static CollectionReference<Map<String, dynamic>> kBlogCollection =
      FirebaseFirestore.instance.collection('blogsCollection');
  static CollectionReference<Map<String, dynamic>> kProgramsCollection =
      FirebaseFirestore.instance.collection('programsCollection');
  static CollectionReference<Map<String, dynamic>> kEventsCollection =
      FirebaseFirestore.instance.collection('EventsCollection');
  static final firebase_storage.FirebaseStorage kStorage =
      firebase_storage.FirebaseStorage.instance;
}
