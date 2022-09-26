import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import '../../../../backend/models/user_model.dart';
import '../../../../backend/services/system.dart';
import '../../../../configurations/back_end.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_button.dart';
import '../../../elements/custom_text.dart';
import 'widgets/bottom_sheet_container.dart';
import 'widgets/profile_view_text_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();
  String _profileImage = '';

  bool isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 50),
          child: StreamProvider.value(
            value: SystemServices().fetchUserInfo(),
            initialData: UserModel(),
            builder: (context, child) {
              UserModel userData = context.watch<UserModel>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                            ),
                            builder: (context) {
                              return Container(
                                height: 150,
                                padding: const EdgeInsets.all(20),
                                color: FrontEndConfigs.kWhiteColor,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          pickImageWithOptionsAndUpload(
                                            source: ImageSource.camera,
                                            folderName: 'ProfileImages',
                                            context: context,
                                          ).then((value) =>
                                              Navigator.pop(context));
                                        },
                                        child: const BottomSheetContainer(
                                          text: 'Take Photo',
                                          icon: Icons.camera_alt_outlined,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          pickImageWithOptionsAndUpload(
                                            source: ImageSource.gallery,
                                            folderName: 'ProfileImages',
                                            context: context,
                                          ).then((value) =>
                                              Navigator.pop(context));
                                        },
                                        child: const BottomSheetContainer(
                                          text: 'Gallery',
                                          icon: Icons.collections,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: userData.profileImage != null ||
                                  _profileImage.isEmpty
                              ? userData.profileImage ??
                                  'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg'
                              : _profileImage,
                          height: 90,
                          width: 90,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover, image: imageProvider),
                                  boxShadow: [
                                    BoxShadow(
                                        color: FrontEndConfigs.kBlackColor
                                            .withOpacity(0.1),
                                        offset: const Offset(0, 3),
                                        spreadRadius: -5,
                                        blurRadius: 10)
                                  ]),
                            );
                          },
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) {
                            return Image.asset('assets/images/profile.png');
                          })),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                            text: 'Edit profile ',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileViewTextField(
                          hintText: userData.name ?? "username",
                          prefixIcon: Icons.person_outline,
                          controller: _nameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfileViewTextField(
                          hintText: userData.email ?? 'Email',
                          prefixIcon: Icons.email_outlined,
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfileViewTextField(
                          hintText: userData.phoneNumber ?? 'Phone Number',
                          prefixIcon: Icons.local_phone_outlined,
                          controller: _phoneNumberController,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                              buttonText: 'Update',
                              height: 46,
                              width: 100,
                              onPressed: () async {
                                makeLoadingTrue();
                                await SystemServices()
                                    .updateUserInfo(UserModel(
                                  uid: FirebaseAuth.instance.currentUser!.uid,
                                  profileImage: _profileImage,
                                  name: _nameController.text.isEmpty
                                      ? userData.name
                                      : _nameController.text,
                                  email: _emailController.text.isEmpty
                                      ? userData.email
                                      : _emailController.text,
                                  phoneNumber:
                                      _phoneNumberController.text.isEmpty
                                          ? userData.phoneNumber
                                          : _phoneNumberController.text,
                                ))
                                    .then((value) {
                                  makeLoadingFalse();
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message: 'Profile Updated Successfully!',
                                      color: FrontEndConfigs.kPrimaryColor);
                                }).onError((error, stackTrace) {
                                  makeLoadingFalse();
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message: 'Something went wrong!',
                                      color: Colors.red);
                                });
                              }),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          )),
    );
  }

  Future<void> _uploadFileAndSetURL(
      String filePath, String fileName, String folderName) async {
    File file = File(filePath);
    UploadTask uploadTask =
        BackEndConfigs.kStorage.ref('$folderName/$fileName').putFile(file);

    try {
      await uploadTask.whenComplete(() async {
        _profileImage = await uploadTask.snapshot.ref.getDownloadURL();
        setState(() {});
      });
    } on firebase_core.FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> pickImageWithOptionsAndUpload(
      {required ImageSource source,
      required String folderName,
      required BuildContext context}) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      FrontEndConfigs.showSnackBar(
          context: context, message: 'No image Selected', color: Colors.red);
      return;
    } else {
      FrontEndConfigs.showSnackBar(
          context: context,
          message: 'Wait until Image Shows up',
          color: FrontEndConfigs.kPrimaryColor);
    }
    final path = image.path;
    final name = image.name;

    _uploadFileAndSetURL(path, name, folderName);
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
