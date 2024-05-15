import 'dart:convert';

import 'package:amazon_frontend/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

void handleHttpError({
  required Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      String errorText = json.decode(response.body)['msg'];
      showSnackBar(context: context, text: errorText);
      break;
    case 404:
    case 500:
      String errorText = json.decode(response.body)['error'];
      showSnackBar(context: context, text: errorText);
      break;
    default:
      showSnackBar(context: context, text: response.body);
      break;
  }
}
