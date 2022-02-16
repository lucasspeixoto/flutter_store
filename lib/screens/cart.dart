import 'package:flutter/material.dart';
import 'package:furniture_store/widgets/app_bar.dart';
import 'package:furniture_store/widgets/cart_list.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    int total = _findTotal();
    final realFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              realFormat.format(total),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBar(
        title: 'Carrinho',
        isCartScreen: true,
      ),
      body: emptyCart(),
    );
  }

  void updateCart() {
    setState(() {});
  }

  int _findTotal() {
    if (Start.cartItems.isNotEmpty) {
      return Start.cartItems
          .map(
            (item) => item.furniture!.price! * item.amount!,
          )
          .reduce(
            (actualPrice, newPrice) => actualPrice + newPrice,
          );
    }
    return 0;
  }

  Widget emptyCart() {
    if (Start.cartItems.isNotEmpty) {
      return CartList(
        updateCart: updateCart,
      );
    } else {
      return Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: const Text('Nenhum item no Carrinho'),
      );
    }
  }
}
