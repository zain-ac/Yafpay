import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample/model/profile_response.dart';

import 'package:http/http.dart' as http;
import 'package:sample/model/registration_response.dart';
import 'package:sample/model/update_tag_response.dart';

import '../utils/app_urls.dart';

class ProfileRepo {
  Future<ProfileResponse> getProfileData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
  final  String? token = sp.getString(ShareManagerKeys.userToken);

    try {

      final response = await http.get(
        Uri.parse(AppUrls.profile),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("ProfileResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return ProfileResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an error.
        // ToastComponent.errorToast(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      // ToastComponent.errorToast('No Internet Connection');

      throw Exception("No Internet Connection");
    }
  }
  Future<UpdateTagResponse> getTag() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
  final  String? token = sp.getString(ShareManagerKeys.userToken);

    try {
      final response = await http.get(
        Uri.parse(AppUrls.tag),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("UpdateTagResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return UpdateTagResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an error.
        // ToastComponent.errorToast(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      // ToastComponent.errorToast('No Internet Connection');

      throw Exception("No Internet Connection");
    }
  }
  Future<UpdateTagResponse> updateTag(String tag) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
  final  String? token = sp.getString(ShareManagerKeys.userToken);

    try {
      Map<String, dynamic> data = {
        "yafpayTag": tag
      };
      String jsonBody = json.encode(data);
      final response = await http.post(
        Uri.parse(AppUrls.tag),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body:jsonBody,
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("UpdateTagResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return UpdateTagResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an error.
        // ToastComponent.errorToast(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      // ToastComponent.errorToast('No Internet Connection');

      throw Exception("No Internet Connection");
    }
  }
}
