import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/pages/profile_page.dart';
import 'package:antria_mobile_pelanggan/features/search_page/presentation/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../features/history/presentation/pages/history_page.dart';
import '../features/home/presentation/pages/home_page.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const SearchPage(isBottomNav: false), // Pass isBottomNav here
    const HistoryPage(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: screens.elementAt(selectedIndex),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                height: 54,
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                        color:
                            selectedIndex == 0 ? whiteColor : inactiveBottomNav,
                      ),
                      onPressed: () => onItemTapped(0),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 28,
                        color:
                            selectedIndex == 1 ? whiteColor : inactiveBottomNav,
                      ),
                      onPressed: () => onItemTapped(1),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.history,
                        size: 30,
                        color:
                            selectedIndex == 2 ? whiteColor : inactiveBottomNav,
                      ),
                      onPressed: () => onItemTapped(2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.account_circle_rounded,
                        size: 30,
                        color:
                            selectedIndex == 3 ? whiteColor : inactiveBottomNav,
                      ),
                      onPressed: () => onItemTapped(3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
