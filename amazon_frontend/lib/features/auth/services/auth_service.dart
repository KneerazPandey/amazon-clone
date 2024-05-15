import 'dart:convert';

import 'package:amazon_frontend/core/constant/app_data.dart';
import 'package:amazon_frontend/core/errors/errors.dart';
import 'package:amazon_frontend/core/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthService {
  Future<void> register({
    required String email,
    required String name,
    required String password,
    required BuildContext context,
  }) async {
    try {
      Uri uri = Uri.parse('${AppData.baseUrl}/api/user/register/');
      Map<String, dynamic> data = <String, dynamic>{
        'name': name,
        'email': email,
        'password': password,
      };
      Response response = await post(
        uri,
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (!context.mounted) return;
      handleHttpError(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context: context,
            text: 'Account Created! Login with the same credentials',
          );
        },
      );
    } catch (error) {
      showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
