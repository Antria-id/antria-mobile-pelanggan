import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/card_detail_order.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCardOrder extends StatefulWidget {
  const ListCardOrder({
    super.key,
  });

  @override
  State<ListCardOrder> createState() => _ListCardOrderState();
}

class _ListCardOrderState extends State<ListCardOrder> {
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    context.read<OrderListBloc>().add(GetProductsInOrderListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderListBloc, OrderListState>(
      builder: (context, state) {
        if (state is OrderListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OrderListLoaded) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: SizedBox(
              height: 260,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final cart = state.products[index];
                  return CardDetailOrder(
                    imageUrl:
                        '${APIUrl.baseUrl}${APIUrl.imagePath}${cart['gambar']}',
                    name: cart['nama_produk'],
                    price: cart['harga'],
                    kuantitas: cart['quantity'],
                    productId: cart['id'],
                    note: cart['note'],
                    onTap: () {
                      int id = cart['id'];
                      notesController.text = cart['note'] ?? '';
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Text(
                                        'Tambah Catatan',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: notesController,
                                      maxLength: 100,
                                      decoration: const InputDecoration(
                                        hintText:
                                            'Contoh: Jangan pakai lalapan ya!',
                                        hintStyle: TextStyle(
                                          color: blackColor,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: blackColor),
                                        ),
                                      ),
                                      maxLines: 4,
                                      style: blackTextStyle,
                                    ),
                                    const SizedBox(height: 20),
                                    Center(
                                      child: CustomButton(
                                        title: 'Simpan',
                                        onPressed: () {
                                          context.read<OrderListBloc>().add(
                                                AddNoteEvent(
                                                  id: id,
                                                  note: notesController.text
                                                      .trim(),
                                                ),
                                              );
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          );
        } else if (state is ProductAddedToOrderList) {
          BlocProvider.of<OrderListBloc>(context)
              .add(GetProductsInOrderListEvent());
        }
        return const Center(
          child: Text(
            'Anda Belum memesan',
          ),
        );
      },
    );
  }
}
