import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthUserService with ChangeNotifier {
  Uri url = Uri.parse('https://agile-beach-41948.herokuapp.com/auth/register');
  Uri urlUser = Uri.parse('https://agile-beach-41948.herokuapp.com/user/me');
  Future registerUser({
    required String email,
    required String name,
    required String deviceID,
    required String type_acount,
  }) async {
    final userData = {
      'email': email,
      'name': name,
      'deviceID': deviceID,
      "type_acount": type_acount
    };
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(userData),
      );
      print(response.statusCode);
      switch (response.statusCode) {
        case 201:
          var jsonResponse =
              convert.jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<bool> validateEmailResult(String? accesstoken) async {
    try {
      final response = await http.post(
          Uri.parse('https://agile-beach-41948.herokuapp.com/user/me'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $accesstoken',
          });
      print(response.statusCode);
      if (response.statusCode == 201) {
        var jsonRespon = await convert.jsonDecode(response.body);
        return jsonRespon['email_verificated'];
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
