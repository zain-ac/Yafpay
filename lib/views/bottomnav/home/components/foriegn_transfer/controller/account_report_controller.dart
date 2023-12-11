import 'package:flutter/cupertino.dart';

class AccountReportController extends ChangeNotifier {
  bool _foreignAccount = true;
  bool _accountStatement = false;

  bool get foreignAccount => _foreignAccount;

  bool get accountStatement => _accountStatement;

  void foreignAccountActive() {
    _foreignAccount = true;
    _accountStatement = false;

    notifyListeners();
  }

  void accountStatementActive() {
    _foreignAccount = false;
    _accountStatement = true;

    notifyListeners();
  }
}
