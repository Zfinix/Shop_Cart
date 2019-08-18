import 'package:flutter/material.dart';
import 'package:shop_cart/model/cardModel.dart';

class HomeController with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _numClicked = false;
  bool get numClicked => _numClicked;

  double _totalCost = 0.00;
  double get totalCost => _totalCost;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  String _searchText;
  String get searchText => _searchText;

  List<CardModel> _chairList = [
    CardModel(name: 'The coolest chair', price: '69.00', image: 'chair1'),
    CardModel(name: 'The nicest chair', price: '112.00', image: 'chair2'),
    CardModel(name: 'Simple chair', price: '85.00', image: 'chair3')
  ];

  List<CardModel> get chairList => _chairList;

  CardModel _newCard;
  CardModel get newCard => _newCard;

  var _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  void removeCard() {
    if (_chairList.length > 0) _chairList.removeAt(_currentIndex);
    notifyListeners();
  }

  void addCard() async {
    if (_newCard != null) {
      _chairList.add(_newCard);
    }
    _newCard = null;
    notifyListeners();
  }

  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  set isSearching(val) {
    _isSearching = val;
    notifyListeners();
  }

  set setNewCard(CardModel val) {
    _newCard = val;
    notifyListeners();
  }

  set searchText(val) {
    _searchText = val;
    notifyListeners();
  }

  set chairList(val) {
    _chairList = val;
    notifyListeners();
  }

  set totalCost(num val) {
    _totalCost = val;
    notifyListeners();
  }

  set numClicked(bool val) {
    _numClicked = val;
    notifyListeners();
  }

  //Logic to handle longCLick/ longPressed Event
  void setNumClicked(val) {
    numClicked = val;
  }

  //Logic to add to total price
  void addNum() {
    var price = double.parse(chairList[_currentIndex].price);

    if (chairList[_currentIndex].quantity >= 1) {
      chairList[_currentIndex].quantity++;

      totalCost += price;
    } else if (chairList[_currentIndex].quantity == 0) {
      chairList[_currentIndex].quantity++;

      totalCost += price;
    }
    notifyListeners();
  }

  //Logic to subtract from total price
  void subNum() {
    var price = double.parse(_chairList[_currentIndex].price);

    if (_chairList[_currentIndex].quantity > 0) {
      _chairList[_currentIndex].quantity--;

      _totalCost -= price;
      print(totalCost);
    }
    notifyListeners();
  }

  int totalItems() {
    var m = 0;
    for (var item in _chairList) {
      m += item.quantity;
    }
    
    return m;
    
  }
}
