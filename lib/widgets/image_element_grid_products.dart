import 'package:flutter/cupertino.dart';

class ImageGridElementProducts extends StatelessWidget {
  final String? image;

  const ImageGridElementProducts({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Image(
      image: AssetImage(
        'utils/assets/images/$image',
      ),
      fit: BoxFit.cover,
    ));
  }
}
