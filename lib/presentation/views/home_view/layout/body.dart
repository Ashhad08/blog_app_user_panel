import 'package:blog_app_user_panel/configurations/back_end.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/blog_model.dart';
import '../../../../backend/services/system.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/blog_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'What’s new in feeds',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textColor: FrontEndConfigs.kSecondaryColor,
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  height: 44,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffEBEBEB),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 21,
                      ),
                      Icon(
                        Icons.search_rounded,
                        size: 30,
                        color: Color(0xffB4B2B2),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomText(
                        text: 'Search by name',
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xffB4B2B2),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: StreamProvider.value(
              initialData: [BlogModel()],
              value: SystemServices().fetchAllBlogs(),
              builder: (context, child) {
                List<BlogModel> _myBlogsList = context.watch<List<BlogModel>>();
                if (_myBlogsList.isEmpty) {
                  return const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Center(
                      child: CustomText(
                        text: 'NO Blogs Uploaded',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: FrontEndConfigs.kPrimaryColor,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _myBlogsList.length,
                      itemBuilder: (context, index) {
                        List likeIdsList = [];
                        // BackEndConfigs.kBlogCollection
                        //     .doc(_myBlogsList[index].blogId)
                        //     .snapshots()
                        //     .listen((DocumentSnapshot snapshot) {
                        //   setState(() {
                        //     likeIdsList.clear();
                        //     likeIdsList.add(snapshot.get("isLiked"));
                        //   });
                        // });
                        return BlogCard(
                          imagePath: _myBlogsList[index].blogImage ??
                              'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                          title: _myBlogsList[index].blogTitle ?? '',
                          description:
                              _myBlogsList[index].blogDescription ?? '',
                          likeButton: IconButton(
                            onPressed: () async {
                              if (!(likeIdsList.toString().contains(
                                  FirebaseAuth.instance.currentUser!.uid))) {
                                await BackEndConfigs.kBlogCollection
                                    .doc(_myBlogsList[index].blogId)
                                    .set({
                                  "isLiked": FieldValue.arrayUnion(
                                      [FirebaseAuth.instance.currentUser!.uid]),
                                }, SetOptions(merge: true)).whenComplete(() {
                                  BackEndConfigs.kBlogCollection
                                      .doc(_myBlogsList[index].blogId)
                                      .snapshots()
                                      .listen((DocumentSnapshot snapshot) {
                                    setState(() {
                                      likeIdsList.clear();
                                      likeIdsList.add(snapshot.get("isLiked"));
                                    });
                                    print(
                                        likeIdsList.toString() + 'array union');
                                  });
                                });
                              } else {
                                await BackEndConfigs.kBlogCollection
                                    .doc(_myBlogsList[index].blogId)
                                    .set({
                                  "isLiked": FieldValue.arrayRemove(
                                      [FirebaseAuth.instance.currentUser!.uid]),
                                }, SetOptions(merge: true)).whenComplete(() {
                                  BackEndConfigs.kBlogCollection
                                      .doc(_myBlogsList[index].blogId)
                                      .snapshots()
                                      .listen((DocumentSnapshot snapshot) {
                                    setState(() {
                                      likeIdsList.clear();
                                      likeIdsList.add(snapshot.get("isLiked"));
                                    });
                                    print(likeIdsList.toString() +
                                        'array remove');
                                  });
                                });
                              }
                            },
                            icon: !(likeIdsList.toString().contains(
                                    FirebaseAuth.instance.currentUser!.uid))
                                ? const Icon(
                                    Icons.favorite_border,
                                    color: FrontEndConfigs.kSecondaryColor,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: FrontEndConfigs.kPrimaryColor,
                                  ),
                          ),
                          totalLikes: const CustomText(
                              text: '${0} likes',
                              // text: '${likesList.length.toString()} likes',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

// _likeBlog() {
//   BackEndConfigs.kBlogCollection.doc(blogId).set({
//     "isLiked":
//         FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
//   }, SetOptions(merge: true)).whenComplete(() {
//     _getLikesIds();
//   });
// }
//
// _disLikeBlog() {
//   BackEndConfigs.kBlogCollection.doc(blogId).set({
//     "isLiked":
//         FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid]),
//   }, SetOptions(merge: true)).whenComplete(() {
//     _getLikesIds();
//   });
// }
//
// _getLikesIds() async {
//   BackEndConfigs.kBlogCollection
//       .doc(blogId)
//       .snapshots()
//       .listen((DocumentSnapshot snapshot) {
//     setState(() {
//       likeIdsList.clear();
//       likeIdsList.add(snapshot.get("isLiked"));
//     });
//   });
// }
}
