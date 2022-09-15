import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/event_model.dart';
import '../../../../backend/services/system.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import '../../../routes/route_names.dart';
import '../../programs_view/layout/widgets/program_card.dart';
import 'widgets/event_card.dart';

class EventsViewBody extends StatelessWidget {
  const EventsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 17,
                ),
                const CustomText(
                  text: 'Upcoming Events',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: Color(0xff585858),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 170,
                  child: StreamProvider.value(
                    value: SystemServices().fetchAllUpcomingEvents(),
                    initialData: [EventModel(eventGalleryImages: [])],
                    builder: (context, child) {
                      List<EventModel> upcomingEventsList =
                          context.watch<List<EventModel>>();
                      if (upcomingEventsList.isEmpty) {
                        return const Center(
                          child: CustomText(
                            text: 'NO Upcoming Events',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textColor: FrontEndConfigs.kPrimaryColor,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: upcomingEventsList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteNames.eventDetailsViewRoute,
                                      arguments: upcomingEventsList[index]);
                                },
                                child: EventCard(
                                  title: upcomingEventsList[index].eventTitle ??
                                      '',
                                  description: upcomingEventsList[index]
                                          .eventDescription ??
                                      '',
                                  date: DateFormat("MMM d, yyyy")
                                      .format(formatDate(
                                    upcomingEventsList[index].eventDate ??
                                        Timestamp.now(),
                                  )),
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const CustomText(
                  text: 'Past Events',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: Color(0xff585858),
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
          StreamProvider.value(
              value: SystemServices().fetchAllPastEvents(),
              initialData: [EventModel(eventGalleryImages: [])],
              builder: (context, child) {
                List<EventModel> pastEventsList =
                    context.watch<List<EventModel>>();
                if (pastEventsList.isEmpty) {
                  return const Center(
                    child: CustomText(
                      text: 'NO Past Events',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textColor: FrontEndConfigs.kPrimaryColor,
                    ),
                  );
                } else {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: pastEventsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        try {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.eventDetailsViewRoute,
                                  arguments: pastEventsList[index]);
                            },
                            child: ProgramCard(
                                imagePath:
                                    pastEventsList[index].eventGalleryImages[0],
                                title: pastEventsList[index].eventTitle ?? '',
                                description:
                                    pastEventsList[index].eventDescription ??
                                        '',
                                date: DateFormat("EEEE, MMMM d, yyyy").format(
                                    formatDate(
                                        pastEventsList[index].eventDate ??
                                            Timestamp.now()))),
                          );
                        } catch (e) {
                          debugPrint(e.toString());
                          return const SizedBox();
                        }
                      });
                }
              })
        ],
      ),
    );
  }

  DateTime formatDate(Timestamp date) {
    return date.toDate();
  }
}
