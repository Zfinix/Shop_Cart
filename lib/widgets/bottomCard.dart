import 'package:flutter/material.dart';
import 'package:shop_cart/providers/homeController.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/margin.dart';

class BottomCard extends StatelessWidget {
  final HomeController controller;
  const BottomCard({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        children: <Widget>[
          Flexible(
              flex: 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Container(
                  height: 50,
                  child: Material(
                    color: darkGrey,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            Text('Pay Order',
                                style: TextStyle(
                                  color: orange,
                                  fontSize: 14,
                                )),
                            Spacer(),
                            Text(
                                '\$'
                                '${controller?.totalCost?.toStringAsFixed(2) ?? 0.00}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: orange,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          const XMargin(10),
          Flexible(
            flex: 2,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: darkGrey, borderRadius: BorderRadius.circular(9)),
              child: Center(
                child: Icon(
                  Icons.face,
                  color: yellow,
                  size: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
