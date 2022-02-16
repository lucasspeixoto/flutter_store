import 'package:furniture_store/models/furniture.dart';

class CartItem {
  final Furniture? furniture;

  int? amount;

  CartItem({
    this.furniture,
    this.amount,
  });
}
