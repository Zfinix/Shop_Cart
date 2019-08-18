import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart/providers/homeController.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/margin.dart';
import 'package:shop_cart/widgets/bottomCard.dart';
import 'package:shop_cart/widgets/chairItems.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<HomeController>(context);

    return Scaffold(
      backgroundColor: yellow,
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/mesh.png'),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const YMargin(130),
                  Row(
                    children: <Widget>[
                      const XMargin(40),
                      Text('Shopping',
                          style: TextStyle(
                              color: darkGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 28)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const XMargin(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('Cart',
                              style: TextStyle(
                                  color: darkGrey,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28)),
                          XMargin(MediaQuery.of(context).size.width * 0.56),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              size: 32,
                              color: darkGrey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const YMargin(10),
                  Row(
                    children: <Widget>[
                      const XMargin(40),
                      Text(
                          '${_controller?.totalItems() ?? 0}'
                          ' items for ',
                          style: TextStyle(
                              color: darkGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 19)),
                      Text(
                          '\$'
                          '${_controller?.totalCost?.toStringAsFixed(2) ?? 0.00}',
                          style: TextStyle(
                              color: darkGrey,
                              fontWeight: FontWeight.w300,
                              fontSize: 18)),
                    ],
                  ),
                  const YMargin(10),
                  Expanded(
                    child: FadingEdgeScrollView.fromScrollView(
                      gradientFractionOnEnd: 0.5,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _controller?.chairList?.length ?? 0,
                        itemBuilder: (BuildContext context, int i) {
                          return ChairListItem(
                            index: i,
                            controller: _controller,
                            cardModel: _controller.chairList[i],
                          );
                        },
                      ),
                    ),
                  ),
                  BottomCard(
                    controller: _controller,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
