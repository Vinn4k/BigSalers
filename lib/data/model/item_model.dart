import 'dart:convert';
ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));
String itemModelToJson(ItemModel data) => json.encode(data.toJson());
class ItemModel {
  ItemModel({
      this.title, 
      this.type, 
      this.description, 
      this.filename, 
      this.height, 
      this.width, 
      this.price, 
      this.rating,});

  ItemModel.fromJson(dynamic json) {
    title = json['title'];
    type = json['type'];
    description = json['description'];
    filename = json['filename'];
    height = json['height'];
    width = json['width'];
    price = json['price'];
    rating = json['rating'];
  }
  String? title;
  String? type;
  String? description;
  String? filename;
  int? height;
  int? width;
  double? price;
  int? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['type'] = type;
    map['description'] = description;
    map['filename'] = filename;
    map['height'] = height;
    map['width'] = width;
    map['price'] = price;
    map['rating'] = rating;
    return map;
  }

}