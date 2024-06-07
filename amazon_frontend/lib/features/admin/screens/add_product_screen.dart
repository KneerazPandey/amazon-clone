import 'dart:io';

import 'package:amazon_frontend/core/common/custom_elevated_button.dart';
import 'package:amazon_frontend/core/common/custom_text_form_field.dart';
import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:amazon_frontend/core/utils/pick_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController _productNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late List<String> _productCategories;
  late String _selectedCategory;
  late List<File> _images;

  @override
  void initState() {
    super.initState();
    _productNameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _quantityController = TextEditingController();
    _productCategories = <String>[
      'Mobiles',
      'Essentials',
      'Appliances',
      'Books',
      'Fashion',
    ];
    _selectedCategory = _productCategories[0];
    _images = [];
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      _images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: AppColor.appBarGradient,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Add Product',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                _images.isNotEmpty
                    ? CarouselSlider(
                        items: _images.map((image) {
                          return Builder(builder: (BuildContext context) {
                            return Image.file(
                              image,
                              height: 200,
                              fit: BoxFit.cover,
                            );
                          });
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const <double>[10, 4],
                          strokeCap: StrokeCap.round,
                          color: Colors.black54,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Select product image',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: _productNameController,
                  hintText: "Product Name",
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _descriptionController,
                  hintText: "Description",
                  maxLines: 6,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _priceController,
                  hintText: "Product Price",
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _quantityController,
                  hintText: "Product Quantity",
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    onChanged: (String? value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                    value: _selectedCategory,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: _productCategories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'Sell',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
