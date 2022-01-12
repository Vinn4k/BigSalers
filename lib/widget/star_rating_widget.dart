import 'package:flutter/material.dart';

///seta a cor das estrelas
List<Widget> starRatingWidget(int rating) {
  List<Widget> array = [];
  var filled = Colors.amber;
  var empty = Colors.black;
  for (var i = 1; i <= 5; i++) {
    array.add(Icon(Icons.star, color: (rating < i ? empty : filled)));
  }
  return array;
}
