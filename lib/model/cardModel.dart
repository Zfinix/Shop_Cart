import 'package:flutter/material.dart';

class CardModel {
  String name;
  String price;
  String image;
  int quantity;
  bool isSelected;

  CardModel({
    @required this.name,
    @required this.price,
    @required this.image,
    this.isSelected = false,
    this.quantity = 0,
  });
}
