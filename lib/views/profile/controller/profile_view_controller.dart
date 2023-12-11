import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample/model/profile_response.dart';

import '../../../helper/toastComponent.dart';
import '../../../model/update_tag_response.dart';
import '../../../repositry/profile_repo.dart';

class ProfileViewController extends ChangeNotifier {
  bool _basicInfo = true;
  bool _notification = false;
  bool _security = false;
  bool _limits = false;
  bool _others = false;

  bool get basicInfo => _basicInfo;

  bool get notification => _notification;

  bool get security => _security;

  bool get limits => _limits;

  bool get others => _others;

  void basicActive() {
    _basicInfo = true;
    _notification = false;
    _security = false;
    _limits = false;
    _others = false;
    notifyListeners();
  }

  void notificationActive() {
    _basicInfo = false;
    _notification = true;
    _security = false;
    _limits = false;
    _others = false;
    notifyListeners();
  }

  void securityActive() {
    _basicInfo = false;
    _notification = false;
    _security = true;
    _limits = false;
    _others = false;
    notifyListeners();
  }

  void limitsActive() {
    _basicInfo = false;
    _notification = false;
    _security = false;
    _limits = true;
    _others = false;
    notifyListeners();
  }

  void othersActive() {
    _basicInfo = false;
    _notification = false;
    _security = false;
    _limits = false;
    _others = true;
    notifyListeners();
  }

  // api related
  // api related
  // api related
  // api related
  // api related
  // api related
  // api related

  ProfileResult? get profileResult => _profileResult;

  TagResult? get tagResult => _tagResult;

  ProfileResult? _profileResult;
  TagResult? _tagResult;

  ProfileRepo profileRepo = ProfileRepo();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loading = false;

  bool get loading => _loading;

  Future<void> getProfileData() async {
    setLoading(true);
    profileRepo.getProfileData().then((value) async {
      if (value != null && value.statusCode == 0) {
        _profileResult = value.result;
        print('PorfileResult:${_profileResult!.user!.email.toString()}');
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

  Future<void> getTag() async {
    setLoading(true);
    profileRepo.getTag().then((value) async {
      if (value != null && value.statusCode == 0) {
        _tagResult = value.result;
        print('getTag:${_tagResult!.yafpayTag}');
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

  Future<void> updateTag(String tag,BuildContext context) async {
    setLoading(true);
    profileRepo.updateTag(tag).then((value) async {
      if (value != null && value.statusCode == 0) {
        _tagResult = value.result;
        print('getTag:${_tagResult!.yafpayTag}');
        getTag();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Tag Updated')));
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
