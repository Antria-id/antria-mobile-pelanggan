import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/chat_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/history_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/home_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/info_restaurant.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/queue_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const HomePage(),
    const QueuePage(),
    const ChatPage(),
    const HistoryPage(),
    const InfoRestaurantPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      icon: const Icon(
                        Icons.home,
                        size: 30,
                      ),
                      color: whiteColor,
                      onPressed: () => onItemTapped(0),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.list,
                        size: 34,
                      ),
                      color: whiteColor,
                      onPressed: () => onItemTapped(1),
                    ),
                    InkWell(
                      onTap: () => onItemTapped(2),
                      child: const Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Icon(
                            CupertinoIcons.chat_bubble_text_fill,
                            size: 28,
                            color: whiteColor,
                          ),
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: Color(0xffFF0000),
                            child: Text(
                              '0',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.history,
                        size: 30,
                      ),
                      color: whiteColor,
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
