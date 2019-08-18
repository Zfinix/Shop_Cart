import 'package:flutter/material.dart';

class XMargin extends StatelessWidget{
  final double x;
  const XMargin(this.x);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
  
}

class YMargin extends StatelessWidget{
  final double y;
  const YMargin(this.y);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
  
}
