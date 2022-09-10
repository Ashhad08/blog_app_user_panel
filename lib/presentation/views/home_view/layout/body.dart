import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/blog.dart';
import '../../../../backend/services/system.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/blog_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

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
                        return BlogCard(
                          imagePath: _myBlogsList[index].blogImage.toString(),
                          title: _myBlogsList[index].blogTitle.toString(),
                          description:
                              _myBlogsList[index].blogDescription.toString(),
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
}
