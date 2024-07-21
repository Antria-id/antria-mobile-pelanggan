import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/custom_button_service.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListServiceType extends StatefulWidget {
  final ValueChanged<Map<String, bool>> onPemesananType;
  final int initialSelectedIndex;
  final int mitraId;

  const ListServiceType({
    super.key,
    required this.onPemesananType,
    required this.initialSelectedIndex,
    required this.mitraId,
  });

  @override
  ListServiceTypeState createState() => ListServiceTypeState();
}

class ListServiceTypeState extends State<ListServiceType> {
  final List<Map<String, dynamic>> pemesananTypeList = [
    {
      'label': 'Take Away',
      'icon': 'assets/icons/takeaway.png',
      'isDineIn': false,
      'isTakeAway': true,
    },
    {
      'label': 'Dine In',
      'icon': 'assets/icons/dine-in.png',
      'isDineIn': true,
      'isTakeAway': false,
    },
  ];

  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoRestaurantBloc()
        ..add(InfoRestaurantUserEvent(mitraId: widget.mitraId)),
      child: BlocBuilder<InfoRestaurantBloc, InfoRestaurantState>(
        builder: (context, state) {
          bool isDineInDisabled = false;
          if (state is InfoRestaurantLoadedState) {
            isDineInDisabled = state.response.statusToko == 'FULL';
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(
                  pemesananTypeList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 1 && isDineInDisabled) {
                          // Dine In is disabled, do nothing
                          return;
                        }
                        setState(() {
                          selectedIndex = index;
                        });
                        widget.onPemesananType({
                          'isTakeAway': pemesananTypeList[index]['isTakeAway'],
                          'isDineIn': pemesananTypeList[index]['isDineIn'],
                        });
                        Navigator.pop(context);
                      },
                      child: CardButtonService(
                        label: pemesananTypeList[index]['label'],
                        icon: pemesananTypeList[index]['icon'],
                        isSelected: selectedIndex == index,
                        isDisabled: index == 1 && isDineInDisabled,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
