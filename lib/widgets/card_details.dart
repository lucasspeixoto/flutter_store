import 'package:flutter/material.dart';
import 'package:furniture_store/main.dart';
import 'package:furniture_store/models/cart_item.dart';
import 'package:furniture_store/widgets/text_details.dart';
import 'package:intl/intl.dart';

import '../models/furniture.dart';

class CardDetails extends StatefulWidget {
  final realFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );
  final Furniture? furniture;

  final Function updateCart;

  CardDetails({
    this.furniture,
    required this.updateCart,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardDetails();
  }
}

class _CardDetails extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDetails(
              title: 'Produto - ${widget.furniture?.title}',
              style: Theme.of(context).textTheme.headline1,
            ),
            TextDetails(title: widget.furniture?.description),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.realFormat.format(widget.furniture?.price),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      _checkCartListItems(
                        Start.cartItems,
                        CartItem(
                          furniture: widget.furniture,
                          amount: 1,
                        ),
                      ),
                    },
                    child: const Text(
                      'Comprar',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addItemToCart(CartItem item) {
    Start.cartItems.add(item);
    widget.updateCart();
  }

  void _checkCartListItems(
    List<CartItem> list,
    CartItem item,
  ) {
    setState(() {});

    int index = list.indexWhere(
      (item) => item.furniture == widget.furniture,
    );

    if (index >= 0) {
      list[index].amount = (list[index].amount! + 1);
    } else {
      _addItemToCart(item);
    }
  }
}
