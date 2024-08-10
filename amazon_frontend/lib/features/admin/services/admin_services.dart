import 'dart:convert';
import 'dart:io';

import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:amazon_frontend/core/errors/errors.dart';
import 'package:amazon_frontend/core/models/product.dart';
import 'package:amazon_frontend/core/providers/user_provider.dart';
import 'package:amazon_frontend/core/utils/show_snack_bar.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      final CloudinaryPublic cloudinary = CloudinaryPublic(
        dotenv.env['CLOUDINARY_NAME'] ?? '',
        dotenv.env['CLOUDINARY_UPLOAD_PRESET'] ?? '',
      );

      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(response.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        category: category,
        images: imageUrls,
        price: price,
      );

      Uri uri = Uri.parse('${AppData.baseUrl}/api/admin/add-product/');
      Response response = await post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${userProvider.user.token}',
        },
        body: product.toJson(),
      );

      if (!context.mounted) return;
      handleHttpError(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context: context, text: 'Product added successfully');
          Navigator.pop(context);
        },
      );
    } catch (error) {
      showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }

  Future<List<Product>> getAllProduct({required BuildContext context}) async {
    List<Product> responseProduct = [];
    try {
      final UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      Uri uri = Uri.parse('${AppData.baseUrl}/api/admin/get-products');
      Response response = await get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${userProvider.user.token}',
        },
      );
      if (!context.mounted) return responseProduct;
      handleHttpError(
        response: response,
        context: context,
        onSuccess: () {
          final data = json.decode(response.body);
          for (int i = 0; i < data.length; i++) {
            final product = Product.fromMap(data[i]);
            responseProduct.add(product);
          }
        },
      );
      return responseProduct;
    } catch (error) {
      showSnackBar(context: context, text: error.toString());
      return responseProduct;
    }
  }
}
