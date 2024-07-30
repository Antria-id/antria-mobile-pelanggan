import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class EditProfileCard extends StatefulWidget {
  const EditProfileCard({super.key});

  @override
  State<EditProfileCard> createState() => _EditProfileCardState();
}

class _EditProfileCardState extends State<EditProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 300,
        ),
        child: ElevatedButton(
          onPressed: () async {
            Navigator.pushNamed(
              context,
              '/edit-profile-page',
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(350, 70),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/antria_logo.png',
                width: 40,
                height: 40,
              ),
              Text(
                'Edit Profile',
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.edit,
                color: blackColor,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
