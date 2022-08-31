import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 13, left: 16, right: 16, bottom: 15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: FrontEndConfigs.kWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 2,
                        color: FrontEndConfigs.kBlackColor.withOpacity(0.3)),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/blog1.png',
                  height: 209,
                  fit: BoxFit.fitWidth,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                  text: 'Title Here',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: FrontEndConfigs.kReceivingChatBubbleColor,
                ),
                CustomText(
                  text:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: Color(0xffB4B2B2),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: FrontEndConfigs.kPrimaryColor,
                ),
              ),
              const CustomText(
                  text: '24 likes', fontSize: 12, fontWeight: FontWeight.w400),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chat_bubble_fill,
                  color: FrontEndConfigs.kReceivingChatBubbleColor,
                ),
              ),
              const CustomText(
                  text: '10 Comments',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: FrontEndConfigs.kReceivingChatBubbleColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
