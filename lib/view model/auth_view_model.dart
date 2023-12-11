import 'dart:convert';

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample/model/currency_response.dart';
import 'package:sample/model/user_model.dart';
import 'package:sample/repositry/auth_repo.dart';
import '../helper/toastComponent.dart';
import '../model/country_response.dart';
import '../model/language_response.dart';
import '../model/registration_response.dart';
import '../service/services.dart';
import '../utils/app_urls.dart';
import '../views/auth/login/login_screen.dart';
import '../views/auth/signup/stepper/controller/stepper_controller.dart';
import '../views/bottomnav/new_nav.dart';

class AuthViewModel extends ChangeNotifier {
  final BiometricSetupChecker biometricSetupChecker = BiometricSetupChecker();

  Future<void> authenticateWithFingerprint(BuildContext context) async {
    final bool isBiometricAvailable =
        await biometricSetupChecker.isBiometricAvailable();
    final bool isBiometricsSetUp =
        await biometricSetupChecker.isBiometricsSetUp();
    // final bool isLockScreenSetUp = await biometricSetupChecker.isLockScreenSetUp();
    if (isBiometricAvailable && !isBiometricsSetUp) {
      // ignore: use_build_context_synchronously
      await biometricSetupChecker.showBiometricNotSetUpDialog(context);
    } else if (isBiometricsSetUp) {
      final auth = await LocalAuth.authenticate();
      notifyListeners();
      if (auth) {
        userLogin(userModel!.email.toString(), userModel!.password.toString(),
            context);
      } else {}
    } else {
      false;
    }
    // Handle other cases or proceed with biometric authentication
  }

  bool getIsLoggedIn() {
    return _prefs!.getBool('isLoggedIn') ?? false;
  }

  SharedPreferences? _prefs;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() async {
    _isLoggedIn = true;
    notifyListeners();
    await _prefs!.setBool('isLoggedIn', true);
  }

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

  List<CountryResult> _countries = [];
  List<LanguageResult> _languages = [];
  List<CurrencyResult> _currencies = [];
  bool _success = false;
  bool? _chkFirstTime = false;

  List<CountryResult> get countries => _countries;

  List<LanguageResult> get languages => _languages;

  List<CurrencyResult> get currencies => _currencies;

  AuthRepo authRepo = AuthRepo();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loading = false;

  bool get loading => _loading;

  // save data
  LoginResult? _userData;
  UserModel? _userModel;

  LoginResult? get userData => _userData;

  UserModel? get userModel => _userModel;

  bool? get success => _success;

  bool? get chkFirstTime => _chkFirstTime;

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString(ShareManagerKeys.userData);
    final savedEmail = prefs.getString(ShareManagerKeys.userEmail) ?? '';
    final firstTimeOpen = prefs.getBool(ShareManagerKeys.firstTime) ?? false;
    final savedPassword = prefs.getString(ShareManagerKeys.userPassword) ?? '';

    if (savedEmail != "" && savedPassword != "") {
      _userModel = UserModel(email: savedEmail, password: savedPassword);
    } else {
      _userModel = null;
    }
    if (firstTimeOpen != false) {
      _chkFirstTime = firstTimeOpen;
    } else {
      _chkFirstTime = false;
    }
    if (dataJson != null) {
      _userData = LoginResult.fromJson(json.decode(dataJson));
    } else {
      _userData = null;
    }
    notifyListeners();
  }

  Future<void> saveData(LoginResult data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        ShareManagerKeys.userData, json.encode(data.toJson()));
    _userData = data;
    notifyListeners();
  }

  Future<void> removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ShareManagerKeys.userData);
    _userData = null;
    notifyListeners();
  }

  AuthViewModel() {
    _init();
  }

  //
  // Future<void> _init() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = _prefs!.getBool('isLoggedIn') ?? false;
  //
  // }
  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    _isLoggedIn = _prefs!.getBool('isLoggedIn') ?? false;

    loadData();
    if (_isLoggedIn) {}
  }

  Future<void> getCountries() async {
    _countries.clear();
    setLoading(true);
    authRepo.getCountriesApi().then((value) async {
      if (value != null &&
          value.statusCode == 0 &&
          value.message == 'Success') {
        _countries.addAll(value.countryResult!);
        print("asdasd${_countries[0].name}");
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      ToastComponent.errorToast(error.toString());
      if (kDebugMode) {
        print(stackTrace.toString());
      }
    });
  }

  Future<void> userRegister(int country, language, currency, String firstName,
      lastName, email, password, gender, phoneNumber, context) async {
    setLoading(true);
    authRepo
        .userRegistrationApi(
      country,
      language,
      currency,
      firstName,
      lastName,
      email,
      password,
      gender,
      phoneNumber,
    )
        .then((value) async {
      if (value.error == false &&
          value.result == null &&
          value.statusCode == 0 &&
          value.message ==
              "User created successfully. Check your email for OTP.") {
        print('asdadsaadasd');
        print(value.message);

        ToastComponent.successFullToast(value.message.toString());
        nextStep();
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      ToastComponent.errorToast(error.toString());
      if (kDebugMode) {
        print(stackTrace.toString());
      }
    });
  }

  Future<void> verifyOtp(String email, int otpCode, context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    setLoading(true);
    authRepo.verifyOtp(email, otpCode).then((value) async {
      if (value != null && value.statusCode == 0) {
        saveData(value.result!);
        sp.setString(ShareManagerKeys.userToken, value.result!.token ?? "");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("User Created Successfully"),
          duration: Duration(seconds: 2),
        ));
        login();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => NewNav()));
      } else if (value.statusCode == 1 && value.error == true) {
        ToastComponent.errorToast(value.message.toString());
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      ToastComponent.errorToast(error.toString());
      if (kDebugMode) {
        print(stackTrace.toString());
      }
    });
  }

  Future<void> userLogin(String email, password, BuildContext context) async {
    setLoading(true);
    authRepo.userLogin(email, password, context).then((value) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      if (value != null && value.statusCode == 0) {
        saveData(value.result!);
        sp.setString(ShareManagerKeys.userEmail, email.toLowerCase());
        sp.setString(ShareManagerKeys.userPassword, password);
        sp.setString(ShareManagerKeys.userToken, value.result!.token ?? "");
        sp.setBool(ShareManagerKeys.firstTime, true);
        login();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => NewNav()));
      } else if (value.message == "Invalid credentials") {
        ToastComponent.errorToast(value.message.toString());
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      ToastComponent.errorToast(error.toString());
      if (kDebugMode) {
        print(stackTrace.toString());
      }
    });
  }

  Future<void> getLanguages() async {
    _languages.clear();
    setLoading(true);

    authRepo.getLanguagesApi().then((value) async {
      if (value.message == 'Success' && value.statusCode == 0) {
        _languages.addAll(value.result!);
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      ToastComponent.errorToast(error.toString());
      if (kDebugMode) {
        print(stackTrace.toString());
      }
    });
  }

  Future<void> getCurrencies() async {
    setLoading(true);

    authRepo.getCurrencyApi().then((value) async {
      if (value.message != null && value.statusCode == Constants.successCode) {
        _currencies.clear();
        _currencies = value.currencyResult ?? [];
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      ToastComponent.errorToast(error.toString());
      if (kDebugMode) {
        print(stackTrace.toString());
      }
    });
  }
}
