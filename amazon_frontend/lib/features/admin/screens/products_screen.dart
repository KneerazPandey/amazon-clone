import 'package:amazon_frontend/core/common/widget.dart';
import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:amazon_frontend/core/models/product.dart';
import 'package:amazon_frontend/features/admin/screens/add_product_screen.dart';
import 'package:amazon_frontend/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  static const String routeName = '/posts';

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product>? _products;
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

  void deleteProduct(Product product) async {
    final deleted = await _adminServices.deleteProduct(
      context: context,
      productToDelete: product,
    );
    if (deleted) {
      setState(() {
        _products!.remove(product);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
              itemCount: _products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                final product = _products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(
                        image: product.images[0],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteProduct(product);
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
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
