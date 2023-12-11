import 'package:flutter/cupertino.dart';

class BenefitsController extends ChangeNotifier {
  List<String> invoiceList = ["56", "57", "22", "31", "43", "24", "27"];

  List<String> get inVL => invoiceList;
}
