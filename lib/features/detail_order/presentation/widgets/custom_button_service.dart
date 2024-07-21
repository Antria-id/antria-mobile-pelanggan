import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class CardButtonService extends StatelessWidget {
  final String label;
  final String icon;
  final bool isSelected;
  final bool isDisabled;

  const CardButtonService({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: isSelected ? primaryColor : greyColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: isDisabled ? Colors.grey.withOpacity(0.5) : Colors.white,
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
                  color: isDisabled ? Colors.grey : null,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDisabled ? Colors.grey : Colors.black,
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
                        color: isDisabled ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
