import 'package:flutter/material.dart';
import 'package:furniture_store/main.dart';
import 'package:furniture_store/models/cart_item.dart';

import '../models/furniture.dart';

import 'package:intl/intl.dart';

class CartList extends StatefulWidget {
  final realFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );
  final List<CartItem> cart = Start.cartItems;

  final Function? updateCart;

  CartList({
    required this.updateCart,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CartListState();
  }
}

class _CartListState extends State<CartList> {
  void _addAmount(CartItem item) {
    setState(() {
      item.amount = (item.amount! + 1);
      widget.updateCart!();
    });
  }

  void _removeAmount(CartItem item) {
    if (item.amount! > 1) {
      setState(() {
        item.amount = (item.amount! - 1);
        widget.updateCart!();
      });
    } else {
      _removeFurniture(item);
    }
  }

  void _removeFurniture(CartItem item) {
    setState(() {
      Start.cartItems.remove(item);
      widget.updateCart!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cart.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        CartItem item = widget.cart[index];
        Furniture? furniture = item.furniture;
        return Container(
          margin: const EdgeInsets.all(16),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Expanded(
                  child: Image(
                      image:
                          AssetImage('utils/assets/images/${furniture?.photo}'),
                      height: 92,
                      fit: BoxFit.cover),
                ),
                Expanded(
                  child: Container(
                    height: 92,
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${furniture?.title}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.realFormat.format(furniture?.price),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => _removeAmount(item),
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    child: const Icon(Icons.remove, size: 18),
                                  ),
                                ),
                                Text('${item.amount}'),
                                GestureDetector(
                                  onTap: () => _addAmount(item),
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    child: const Icon(Icons.add, size: 18),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
