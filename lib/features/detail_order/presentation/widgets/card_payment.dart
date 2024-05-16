import 'package:flutter/material.dart';

class CardPayment extends StatelessWidget {
  final String label;
  final String icon;
  final int selectedIndex;
  final int index;

  const CardPayment({
    Key? key,
    required this.label,
    required this.icon,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isSelected
                  ? const Color.fromARGB(255, 0, 17, 255)
                  : Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      icon,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                isSelected
                    ? const Icon(
                        Icons.check_circle,
                        size: 20,
                        color: Colors.green,
                      )
                    : Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
