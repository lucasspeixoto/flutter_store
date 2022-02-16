import 'package:flutter/material.dart';
import 'package:furniture_store/widgets/indicator_cart_button.dart';

import '../main.dart';

class CartButton extends StatefulWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CartButton();
  }
}

class _CartButton extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/cart')
            .then((value) => {setState(() {})}),
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
        ),
        alignment: Alignment.centerRight,
        height: 40,
        padding: const EdgeInsets.only(
          right: 15,
          left: 20,
        ),
        child: _setOrRemoveCartIndicator(),
      ),
    );
  }

  Widget _setOrRemoveCartIndicator() {
    if (Start.cartItems.isNotEmpty) {
      return Stack(
        children: const [
          Image(
            height: 35,
            image: AssetImage('utils/assets/icons/cart.png'),
          ),
          IndicatorCartButton(),
        ],
      );
    }
    return const Image(
      height: 35,
      image: AssetImage('utils/assets/icons/cart.png'),
    );
  }
}
