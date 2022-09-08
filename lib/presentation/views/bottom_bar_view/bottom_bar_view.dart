import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../configurations/front_end.dart';
import '../events_view/events_view.dart';
import '../home_view/home_view.dart';
import '../profile_view/profile_view.dart';
import '../programs_view/programs_view.dart';
import '../spotlight_view/spotlight_view.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeView(),
    ProgramsView(),
    EventsView(),
    SpotlightView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Center(
          child: _screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                  size: 25,
                  AssetImage(
                    'assets/icons/home.png',
                  )),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  size: 25,
                  AssetImage(
                    'assets/icons/programs.png',
                  )),
              label: 'Programs',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  size: 25,
                  AssetImage(
                    'assets/icons/events.png',
                  )),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  size: 25,
                  AssetImage(
                    'assets/icons/spotlight.png',
                  )),
              label: 'Spotlight',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  size: 25,
                  AssetImage(
                    'assets/icons/profile.png',
                  )),
              label: 'Profile',
            ),
          ],
          backgroundColor: FrontEndConfigs.kWhiteColor,
          elevation: 10,
          selectedLabelStyle: FrontEndConfigs.kTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
          unselectedLabelStyle: FrontEndConfigs.kTextStyle.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),
          currentIndex: _selectedIndex,
          selectedItemColor: FrontEndConfigs.kPrimaryColor,
          unselectedItemColor: FrontEndConfigs.kSubText2Color,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
