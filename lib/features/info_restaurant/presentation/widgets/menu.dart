import 'package:flutter/cupertino.dart';

import 'card_menu.dart';

class Menu extends StatefulWidget {
  final VoidCallback onPress;
  const Menu({
    super.key,
    required this.onPress,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool showCart = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Menu 1',
        'desc': 'Description 1',
        'price': 10000,
        'imageUrl': 'assets/images/menu1.jpg',
        'promo': true,
      },
      {
        'title': 'Menu 2',
        'desc': 'Description 2',
        'price': 15000,
        'imageUrl': 'assets/images/menu2.jpg',
        'promo': false,
      },
      {
        'title': 'Menu 1',
        'desc': 'Description 1',
        'price': 10,
        'imageUrl': 'assets/images/menu1.jpg',
        'promo': true,
      },
      {
        'title': 'Menu 1',
        'desc': 'Description 1',
        'price': 10000,
        'imageUrl': 'assets/images/menu1.jpg',
        'promo': false,
      },
      {
        'title': 'Menu 1',
        'desc': 'Description 1',
        'price': 10000,
        'imageUrl': 'assets/images/menu1.jpg',
        'promo': true,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.7,
        ),
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return CardMenu(
            title: menuItems[index]['title'],
            desc: menuItems[index]['desc'],
            price: menuItems[index]['price'],
            imageUrl: menuItems[index]['imageUrl'],
            promo: menuItems[index]['promo'] ?? false,
            onPress: widget.onPress,
          );
        },
      ),
    );
  }
}
