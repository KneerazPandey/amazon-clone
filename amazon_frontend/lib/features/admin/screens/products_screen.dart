import 'package:amazon_frontend/core/common/widget.dart';
import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:amazon_frontend/core/models/product.dart';
import 'package:amazon_frontend/features/admin/screens/add_product_screen.dart';
import 'package:amazon_frontend/features/admin/screens/admin_screen.dart';
import 'package:amazon_frontend/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  static const String routeName = '/posts';

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = [];
  late AdminServices _adminServices;

  @override
  void initState() {
    _adminServices = AdminServices();
    fetchProducts();
    super.initState();
  }

  void fetchProducts() async {
    final products = await _adminServices.getAllProduct(context: context);
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _products.isEmpty
        ? const Loader()
        : Scaffold(
            body: const Center(
              child: Text('List of Products'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductScreen.routeName);
              },
              backgroundColor: AppColor.selectedNavBarColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              tooltip: 'Add a product',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
