import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardDetailOrder extends StatefulWidget {
  final int productId;
  final String imageUrl;
  final String name;
  final String note;
  final int price;
  final int kuantitas;
  final VoidCallback? onTap;
  const CardDetailOrder({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.kuantitas,
    required this.productId,
    required this.onTap,
    required this.note,
  });

  @override
  State<CardDetailOrder> createState() => _CardDetailOrderState();
}

class _CardDetailOrderState extends State<CardDetailOrder>
    with AutomaticKeepAliveClientMixin {
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      widget.imageUrl,
                      width: 80,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/empty_menu.png',
                        width: 80,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formattedPrice,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff0D1039),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        child: Visibility(
                          visible: widget.note.isNotEmpty,
                          child: Text(
                            'Catatan: ${widget.note}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff0D1039),
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.note_add_rounded,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Catatan',
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
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
                  const SizedBox(height: 4),
                  Text(
                    '$quantity',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
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
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}
