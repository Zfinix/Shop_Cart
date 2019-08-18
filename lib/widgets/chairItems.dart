import 'package:flutter/material.dart';
import 'package:shop_cart/model/cardModel.dart';
import 'package:shop_cart/providers/homeController.dart';
import 'package:shop_cart/utils/colors.dart';
import 'package:shop_cart/utils/margin.dart';

class ChairListItem extends StatefulWidget {
  final index;
  final CardModel cardModel;
  final HomeController controller;

  const ChairListItem(
      {Key key,
      @required this.index,
      @required this.controller,
      @required this.cardModel})
      : super(key: key);

  @override
  _ChairListItemState createState() => _ChairListItemState();
}

class _ChairListItemState extends State<ChairListItem> {
  var numClicked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.cardModel.isSelected ? darkGrey : Colors.transparent,
      child: InkWell(
        onTap: numClicked ? null : _selected,
        onLongPress: !widget.cardModel.isSelected ? null : _setNumClicked,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 23.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const XMargin(20),

              //TOGGLE IMAGE
              !numClicked
                  ? Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          new BoxShadow(
                            spreadRadius: -17,
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 17,
                          ),
                        ],
                      ),
                      child:
                          Image.asset("assets/${widget.cardModel.image}.png"),
                    )
                  : Container(),
              const XMargin(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(widget.cardModel?.name ?? '',
                      style: TextStyle(
                        color: !widget.cardModel.isSelected ? darkGrey : orange,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      )),
                  const YMargin(8),
                  Text('\$${widget.cardModel?.price ?? ''}',
                      style: TextStyle(
                        color: !widget.cardModel.isSelected ? darkGrey : orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      )),
                  //const YMargin(20),
                ],
              ),
              const XMargin(45),

              //ADD/SUBTRACT BUTTON ROWS & QUANTITY
              !numClicked
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Center(
                          child: GestureDetector(
                            onTap: widget.cardModel.isSelected
                                ? _setNumClicked
                                : null,
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: !widget.cardModel.isSelected
                                      ? orange
                                      : grey,
                                  borderRadius: BorderRadius.circular(9)),
                              child: Center(
                                child: Text('${widget.cardModel.quantity}',
                                    style: TextStyle(
                                      color: !widget.cardModel.isSelected
                                          ? darkGrey
                                          : orange,
                                      fontSize: 16,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        const XMargin(40),
                      ],
                    )
                  : Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: widget.cardModel.isSelected
                              ? _setNumClicked
                              : null,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: !widget.cardModel.isSelected
                                    ? orange
                                    : grey,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: Text(widget.cardModel.quantity.toString(),
                                  style: TextStyle(
                                    color: !widget.cardModel.isSelected
                                        ? darkGrey
                                        : orange,
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                        ),
                        const XMargin(15),
                        GestureDetector(
                          onTap: widget.controller.addNum,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: !widget.cardModel.isSelected
                                    ? orange
                                    : grey,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: Text('+',
                                  style: TextStyle(
                                    color: !widget.cardModel.isSelected
                                        ? darkGrey
                                        : orange,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ),
                        const XMargin(15),
                        GestureDetector(
                          onTap: widget.controller.subNum,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: !widget.cardModel.isSelected
                                    ? orange
                                    : grey,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: Text('-',
                                  style: TextStyle(
                                    color: !widget.cardModel.isSelected
                                        ? darkGrey
                                        : orange,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ),
                        const XMargin(15)
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  _selected() {
    //Logic to handle onclick Event
      widget.controller.currentIndex = widget.index;
    numClicked = false;
    for (var i = 0; i < widget.controller.chairList.length; i++) {
      if (widget.index == i) {
        widget.controller.chairList[i].isSelected =
            !widget.controller.chairList[i].isSelected;
      }
    }
    setState(() {});
  }

  void _setNumClicked() {
    //Logic to handle longCLick/ longPressed Event
    numClicked = !numClicked;
    setState(() {});
  }
}
