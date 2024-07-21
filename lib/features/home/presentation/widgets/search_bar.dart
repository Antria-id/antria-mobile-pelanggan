import 'package:flutter/material.dart';
import 'package:antria_mobile_pelanggan/config/themes/themes.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/search-page',
          arguments: true,
        );
      },
      child: Container(
        width: 322,
        height: 48,
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        child: const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Search',
              style: TextStyle(
                fontSize: 14,
                color: fontGreycolor,
              ),
            ),
            Spacer(),
            Icon(
              Icons.search,
              color: fontGreycolor,
            ),
          ],
        ),
      ),
    );
  }
}
