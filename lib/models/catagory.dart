import 'package:flutter/material.dart';

class Catagory {
  final String id;
  final String title;
  final Color color;

  const Catagory(
      {this.color = Colors.orange, @required this.id, @required this.title});
}
