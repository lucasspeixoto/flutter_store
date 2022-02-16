import 'package:flutter/material.dart';
import 'package:furniture_store/widgets/app_bar.dart';
import 'package:furniture_store/widgets/card_details.dart';

import '../models/furniture.dart';

class Details extends StatefulWidget {
  final Furniture? furniture;

  const Details({
    this.furniture,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'utils/assets/images/${widget.furniture?.photo}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: '',
          isCartScreen: false,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(16),
            height: 180,
            child: CardDetails(
              furniture: widget.furniture,
              updateCart: updateItemsCartState,
            ),
          ),
        ),
      ),
    );
  }

  void updateItemsCartState() {
    setState(() {});
  }
}
