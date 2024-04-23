import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/portofolio/portofoliopage.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_application_1/styles/text_style.dart';
import 'package:flutter_application_1/pages/home/homepage.dart';
import 'package:flutter_application_1/pages/portofolio/portofoliopage.dart';
import 'package:flutter_application_1/pages/support/supportpage.dart';
import 'package:flutter_application_1/pages/profile/profilepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const nameRoute = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> pages = [
    HomePage(),
    PortofolioPage(),
    supportpage(),
    profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: pages[_selectedIndex],
      bottomNavigationBar: _customBottomNav(),
    );
  }

  Widget _customBottomNav() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: kGrey,
            blurRadius: 10,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: kCaption,
          unselectedLabelStyle: kCaption,
          selectedItemColor: kBlueRibbon,
          unselectedItemColor: kDarkGray,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/home.png',
                  width: 24,
                  color: _selectedIndex == 0 ? kBlueRibbon : kDarkGray,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/portofolio.png',
                  width: 24,
                  color: _selectedIndex == 1 ? kBlueRibbon : kDarkGray,
                ),
              ),
              label: 'Portofolio',
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/support.png',
                  width: 24,
                  color: _selectedIndex == 2 ? kBlueRibbon : kDarkGray,
                ),
              ),
              label: 'Support',
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  'assets/icons/profile.png',
                  width: 24,
                  color: _selectedIndex == 3 ? kBlueRibbon : kDarkGray,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
