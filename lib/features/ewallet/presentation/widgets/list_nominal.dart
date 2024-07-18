import 'package:flutter/material.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/widgets/card_nominal.dart';

class ListNominal extends StatefulWidget {
  final Function(int) onNominalSelected;

  const ListNominal({Key? key, required this.onNominalSelected})
      : super(key: key);

  @override
  _ListNominalState createState() => _ListNominalState();
}

class _ListNominalState extends State<ListNominal> {
  int? selectedNominal;

  @override
  Widget build(BuildContext context) {
    List<Map<String, int>> nominal = [
      {'nominal': 10000},
      {'nominal': 20000},
      {'nominal': 50000},
      {'nominal': 100000},
      {'nominal': 200000},
      {'nominal': 300000},
      {'nominal': 500000},
      {'nominal': 1000000},
    ];

    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 2.6,
        ),
        itemCount: nominal.length,
        itemBuilder: (context, index) {
          int nominalValue = nominal[index]['nominal']!;
          return CardNominal(
            nominal: nominalValue,
            isSelected: selectedNominal == nominalValue,
            onTap: () {
              setState(() {
                selectedNominal = nominalValue;
              });
              widget.onNominalSelected(nominalValue);
            },
          );
        },
      ),
    );
  }
}
