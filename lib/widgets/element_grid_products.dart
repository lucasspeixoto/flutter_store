import 'package:flutter/material.dart';
import 'package:furniture_store/models/furniture.dart';
import 'package:furniture_store/screens/details.dart';
import 'package:furniture_store/widgets/degrade_element_grid_products.dart';
import 'package:furniture_store/widgets/image_element_grid_products.dart';
import 'package:furniture_store/widgets/title_element_grid_products.dart';

class ElementGridProducts extends StatefulWidget {
  final Furniture? furniture;

  final Function? updateCart;

  const ElementGridProducts({
    this.updateCart,
    this.furniture,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ElementGridProductsState();
  }
}

class _ElementGridProductsState extends State<ElementGridProducts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              furniture: widget.furniture,
            ),
          ),
        ).then((value) => widget.updateCart);
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              color: Colors.black12,
            ),
          ],
        ),
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImageGridElementProducts(
                image: widget.furniture?.photo,
              ),
              const DegradeElementGridProducts(),
              TitleElementGridProducts(
                title: widget.furniture?.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
