import 'package:flutter/material.dart';
import 'package:furniture_store/widgets/cart_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final bool isCartScreen;

  const CustomAppBar({
    required this.title,
    required this.isCartScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        title!,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: <Widget>[
        _changeToCartScreen(isCartScreen),
      ],
    );
  }

  _changeToCartScreen(bool isCartScreen) {
    if (isCartScreen) return Container();
    return const CartButton();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
