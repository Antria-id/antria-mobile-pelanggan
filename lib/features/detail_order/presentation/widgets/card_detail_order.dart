import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/text_field_note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardDetailOrder extends StatefulWidget {
  final int productId;
  final String imageUrl;
  final String name;
  final int price;
  final int kuantitas;
  const CardDetailOrder({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.kuantitas,
  });

  @override
  State<CardDetailOrder> createState() => _CardDetailOrderState();
}

class _CardDetailOrderState extends State<CardDetailOrder>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController noteController = TextEditingController();
  late String note;
  late int quantity;
  @override
  void initState() {
    super.initState();
    quantity = widget.kuantitas;
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(widget.price);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/empty_menu.png',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        formattedPrice,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff0D1039),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 58,
                        height: 32,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: greyColor,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '$quantity',
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 58,
                              height: 2,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldNote(
            onChanged: (value) {
              note = value.trim();
            },
            hintText: 'Tambah Catatan',
          ),
        ],
      ),
    );
  }
}
