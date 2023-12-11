import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider with ChangeNotifier {
  late bool _showOnboarding;

  bool get showOnboarding => _showOnboarding;

  OnboardingProvider() {
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _showOnboarding = prefs.getBool('showOnboarding') ?? true;
    notifyListeners();
  }

  Future<void> setOnboardingStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _showOnboarding = status;
    prefs.setBool('showOnboarding', status);
    notifyListeners();
  }
}