import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  static Future<bool> canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await _auth.authenticate(
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ),
          authMessages: [
            const AndroidAuthMessages(
                signInTitle: 'Sign In', cancelButton: 'No Thanks'),
            const IOSAuthMessages(
              cancelButton: 'No Thanks',
            )
          ],
          localizedReason: 'Use Face Id to authenticate ');
    } catch (e) {
      debugPrint("error $e");
      return false;
    }
  }
  static Future<bool> isBiometricAvailable() async {
    return await _auth.canCheckBiometrics;
  }
}
