import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/model/currency_response.dart';
import 'package:sample/model/language_response.dart';
import 'package:sample/utils/app_urls.dart';

import '../helper/toastComponent.dart';
import '../model/country_response.dart';
import '../model/registration_response.dart';

class AuthRepo {
  Future<ShipmentDetailsResponse> userRegistrationApi(
      int country,
      language,
      currency,
      String firstName,
      lastName,
      email,
      password,
      gender,
      phoneNumber) async {
    Map<String, dynamic> data = {
      "country": country,
      "language": language,
      "currency": currency,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "gender": gender,
      "phoneNumber": phoneNumber
    };
    print('Data Object:$data');

    String jsonBody = json.encode(data);
    print('jsonBody Data:$jsonBody');
    try {
      final response = await http.post(Uri.parse(AppUrls.register),
          headers: {'Content-Type': 'application/json'}, body: jsonBody);
      if (response.statusCode == 201) {
        // If the server did return a 200 OK response, parse the response body
        print("UserRegisterResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return ShipmentDetailsResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an error.

        // Throw a generic exception with the first error message
        // throw Exception(errorResponse);
        // If the server did not return a 200 OK response, throw an error.
        // ToastComponent.errorToast(jsonDecode(response.body)['message']);
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        errorResponse.containsKey('email')
            ? throw Exception(jsonDecode(response.body)['email'][0])
            : throw Exception(jsonDecode(response.body)['phoneNumber'][0]);
      }
    } on SocketException {
      // ToastComponent.errorToast('No Internet Connection');

      throw Exception("No Internet Connection");
    }
  }

  Future<UserRegisterResponse> userLogin(
      String email, password, BuildContext context) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    String jsonBody = json.encode(data);

    try {
      final response = await http.post(Uri.parse(AppUrls.login),
          headers: {'Content-Type': 'application/json'}, body: jsonBody);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("User Login Response:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return UserRegisterResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an error.
        // ToastComponent.errorToast(jsonDecode(response.body)['message']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(jsonDecode(response.body)['message']),
          duration: Duration(seconds: 2),
        ));
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      // ToastComponent.errorToast('No Internet Connection');

      throw Exception("No Internet Connection");
    }
  }

  Future<UserRegisterResponse> verifyOtp(String email, int otpCode) async {
    Map<String, dynamic> data = {"email": email, "otpCode": otpCode};
    String jsonBody = json.encode(data);

    try {
      final response = await http.post(Uri.parse(AppUrls.verifyOtp),
          headers: {'Content-Type': 'application/json'}, body: jsonBody);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("UserRegisterResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return UserRegisterResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an error.
        ToastComponent.errorToast(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      // ToastComponent.errorToast('No Internet Connection');

      throw Exception("No Internet Connection");
    }
  }

  Future<CountryResponse> getCountriesApi() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.countries),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("CountryResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return CountryResponse.fromJson(jsonDecode(response.body));
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

  Future<LanguageResponse> getLanguagesApi() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.language),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("LanguageResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return LanguageResponse.fromJson(jsonDecode(response.body));
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

  Future<CurrencyResponse> getCurrencyApi() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.language),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, parse the response body
        print("CurrencyResponse:${response.body.toString()}");
        // json = jsonDecode(response.body);
        return CurrencyResponse.fromJson(jsonDecode(response.body));
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
