import 'package:blog_app_user_panel/backend/models/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../elements/custom_text.dart';
import 'widgets/event_images_card.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody(this._eventModel, {Key? key}) : super(key: key);

  final EventModel _eventModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              imageUrl: _eventModel.eventGalleryImages[0],
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
                size: 20,
              ),
            )),
        Expanded(
            flex: 7,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                      right: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: DateFormat("EEEE, MMMM d, yyyy")
                                .format(formatDate(
                                  _eventModel.eventDate ?? Timestamp.now(),
                                ))
                                .toUpperCase(),
                            fontSize: 14,
                            textColor: const Color(0xff9D9D9D),
                            fontWeight: FontWeight.w600),
                        const SizedBox(
                          height: 13,
                        ),
                        CustomText(
                            text: _eventModel.eventTitle ?? '',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomText(
                            text: _eventModel.eventDescription ?? '',
                            fontSize: 12,
                            maxLines: 7,
                            textColor: const Color(0xff6A6A6A),
                            fontWeight: FontWeight.w400),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomText(
                            text: 'Event Gallery',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        const SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 144,
                    child: ListView.builder(
                        itemCount: _eventModel.eventGalleryImages.length - 1,
                        padding: const EdgeInsets.only(left: 16),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return EventImagesCard(
                            imagePath:
                                _eventModel.eventGalleryImages[index + 1],
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  DateTime formatDate(Timestamp date) {
    return date.toDate();
  }
}
