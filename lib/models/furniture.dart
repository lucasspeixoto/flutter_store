class Furniture {
  String? title;
  int? price;
  String? photo;
  String? description;

  Furniture({
    this.title,
    this.price,
    this.photo,
    this.description,
  });

  Furniture.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    photo = json['photo'];
    description = json['description'];
  }
}
