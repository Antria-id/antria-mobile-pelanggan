import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/custom_buttton_service.dart';
import 'package:flutter/material.dart';

class StatusService extends StatefulWidget {
  const StatusService({super.key});

  @override
  State<StatusService> createState() => _StatusServiceState();
}

class _StatusServiceState extends State<StatusService> {
  bool showCart = false;
  bool isSelected = false;
  bool isSelectedDineIn = true;
  bool isSelectedTakeaway = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 22,
      ),
      child: Row(
        children: [
          Flexible(
            child: CustomButtonService(
              title: 'Dine In',
              isSelected: isSelectedDineIn,
              onTap: () {
                setState(() {
                  isSelectedDineIn = true;
                  isSelectedTakeaway = false;
                });
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: CustomButtonService(
              title: 'Takeaway',
              isSelected: isSelectedTakeaway,
              onTap: () {
                setState(
                  () {
                    isSelectedTakeaway = true;
                    isSelectedDineIn = false;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
