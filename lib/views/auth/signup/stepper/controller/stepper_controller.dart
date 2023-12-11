import 'package:flutter/cupertino.dart';

class StepperController extends ChangeNotifier {
  int currentStep = 0;

  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }
}
