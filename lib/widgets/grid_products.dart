import 'package:flutter/material.dart';
import 'package:furniture_store/models/furniture.dart';
import 'package:furniture_store/widgets/element_grid_products.dart';

class GridProducts extends StatelessWidget {
  final List<Map<String, Object>> furnitures;

  final Function updateCart;

  const GridProducts({
    required this.updateCart,
    required this.furnitures,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: furnitures.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        final furniture = Furniture.fromJson(
          furnitures[index],
        );

        return ElementGridProducts(
          furniture: furniture,
        );
      },
    );
  }
}
