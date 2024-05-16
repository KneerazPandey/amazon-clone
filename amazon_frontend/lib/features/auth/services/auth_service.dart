import 'dart:convert';

import 'package:amazon_frontend/core/constant/app_data.dart';
import 'package:amazon_frontend/core/errors/errors.dart';
import 'package:amazon_frontend/core/providers/user_provider.dart';
import 'package:amazon_frontend/core/utils/show_snack_bar.dart';
import 'package:amazon_frontend/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> register({
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
      if (!context.mounted) return false;
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
      return true;
    } catch (error) {
      showSnackBar(
        context: context,
        text: error.toString(),
      );
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      Uri uri = Uri.parse('${AppData.baseUrl}/api/user/login/');
      Map<String, dynamic> data = <String, dynamic>{
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
      if (!context.mounted) return false;
      handleHttpError(
        response: response,
        context: context,
        onSuccess: () async {
          String token = json.decode(response.body)['token'];
          print(token);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(AppData.tokenKey, token);
          if (!context.mounted) return;
          Provider.of<UserProvider>(context, listen: false).setUser(
            response.body,
          );
          showSnackBar(
            context: context,
            text: 'Login Successfull',
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
      return true;
    } catch (error) {
      showSnackBar(
        context: context,
        text: error.toString(),
      );
      return false;
    }
  }
}
