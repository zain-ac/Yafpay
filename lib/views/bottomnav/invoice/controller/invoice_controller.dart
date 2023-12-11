import 'package:flutter/cupertino.dart';

class InvoiceController extends ChangeNotifier {
  bool _firstContainer = true;
  bool _secondContainer = false;

  bool get firstContainer => _firstContainer;

  bool get secondContainer => _secondContainer;

  void firstOnTap() {
    _firstContainer = true;
    _secondContainer = false;
    notifyListeners();
  }

  void secondOnTap() {
    _firstContainer = false;
    _secondContainer = true;
    notifyListeners();
  }

  List<String> invoiceList = ["56", "57", "22", "31", "43", "24", "27"];

  List<String> get inVL => invoiceList;
}
