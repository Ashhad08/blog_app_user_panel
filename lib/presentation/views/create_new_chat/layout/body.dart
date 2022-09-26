import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../configurations/back_end.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import '../../../routes/route_names.dart';

class CreateNewChatViewBody extends StatefulWidget {
  const CreateNewChatViewBody({Key? key}) : super(key: key);

  @override
  State<CreateNewChatViewBody> createState() => _CreateNewChatViewBodyState();
}

class _CreateNewChatViewBodyState extends State<CreateNewChatViewBody> {
  final List<DocumentSnapshot> _searchedUsersList = [];
  final List<DocumentSnapshot> _allUsersList = [];
  bool _isSearched = false;

  @override
  initState() {
    super.initState();
    _getAllUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            onChanged: (val) {
              _searchUsers(val);
            },
            style: FrontEndConfigs.kTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: FrontEndConfigs.kUserTextFieldColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: FrontEndConfigs.kWhiteColor,
              contentPadding: const EdgeInsets.only(top: 15),
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
                color: FrontEndConfigs.kUserTextFieldColor,
              ),
              hintText: 'Search by username',
              hintStyle: FrontEndConfigs.kTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: FrontEndConfigs.kUserTextFieldColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 0.2,
                  color: FrontEndConfigs.kBorderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 0.2,
                  color: FrontEndConfigs.kBorderColor,
                ),
              ),
            ),
          ),
        ),
        _searchedUsersList.isEmpty && _isSearched == true
            ? const Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'No Such User Found',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textColor: FrontEndConfigs.kPrimaryColor,
                ),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: _searchedUsersList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.chatViewRoute,
                              arguments: {
                                "receiverUid": _searchedUsersList[index]["uid"],
                                "receiverName": _searchedUsersList[index]
                                    ["name"],
                                "receiverProfileImage":
                                    _searchedUsersList[index]["profileImage"],
                              });
                        },
                        leading: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: _searchedUsersList[index]
                                    ["profileImage"] ??
                                'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                            height: 64,
                            width: 64,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover, image: imageProvider),
                                ),
                              );
                            },
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                'assets/images/profile.png',
                              );
                            }),
                        title: CustomText(
                            text:
                                _searchedUsersList[index]["name"] ?? "username",
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        subtitle: CustomText(
                            text: _searchedUsersList[index]["email"] ?? "email",
                            fontSize: 12,
                            textColor: const Color(0xff838383),
                            fontWeight: FontWeight.w400),
                      );
                    })),
      ],
    );
  }

  _getAllUsersData() {
    BackEndConfigs.kUsersCollection.get().then((value) {
      value.docs.map((e) {
        _allUsersList.add(e);
        setState(() {});
      }).toList();
    });
  }

  _searchUsers(String username) {
    _searchedUsersList.clear();
    for (var i in _allUsersList) {
      var lowerCaseString = i["name"].toString().toLowerCase();
      var upperCaseString = i["name"].toString().toUpperCase();
      var defaultCaseString = i["name"].toString();
      if (lowerCaseString.contains(username) ||
          upperCaseString.contains(username) ||
          defaultCaseString.contains(username)) {
        _searchedUsersList.add(i);
        setState(() {});
      } else {
        setState(() {
          _isSearched = true;
        });
      }
    }
    if (username.isEmpty) {
      _searchedUsersList.clear();
    }
  }
}
