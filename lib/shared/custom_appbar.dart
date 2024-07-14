import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final double titleSize;
  final double? toolbarHeight;
  final FontWeight titleFontWeight;
  final Color backgroundColor;
  final Widget? leading;
  final Widget? child;

  const CustomAppBarWidget({
    Key? key,
    required this.title,
    this.titleColor = Colors.white,
    this.titleSize = 16,
    this.titleFontWeight = FontWeight.bold,
    this.backgroundColor = Colors.transparent,
    this.leading,
    this.child,
    this.toolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: leading,
      toolbarHeight: toolbarHeight,
      title: Text(
        title,
        style: TextStyle(
          fontSize: titleSize,
          fontWeight: titleFontWeight,
          color: titleColor,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(26),
            bottomRight: Radius.circular(26),
          ),
        ),
        child: child,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
