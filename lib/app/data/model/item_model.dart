import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      this.rating,
    this.id,
    this.created
  });

  ItemModel.fromJson(dynamic json) {
    title = json['title'];
    type = json['type'];
    description = json['description'];
    filename = json['filename'];
    height = json['height'];
    width = json['width'];
    price = json['price'];
    rating = json['rating'];
    id = json['id'];
    created= json['created'];
  }
  String? title;
  String? type;
  String? description;
  String? filename;
  int? height;
  int? width;
  double? price;
  int? rating;
  String? id;

  Timestamp? created;


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
    map['id'] = id;
    map['created'] = created;


    return map;
  }

}