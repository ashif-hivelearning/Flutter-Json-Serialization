class ProductModel {
  // 1 ta object
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  String? oldPrice;
  String? price;

  ProductModel({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.oldPrice,
    this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    //1 ta map
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageUrl = json['imageUrl'];
    oldPrice = json['oldPrice'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    data['oldPrice'] = this.oldPrice;
    data['price'] = this.price;
    return data;
  }
}
