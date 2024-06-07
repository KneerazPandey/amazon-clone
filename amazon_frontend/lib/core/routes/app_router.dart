import 'package:amazon_frontend/core/common/bottom_bar.dart';
import 'package:amazon_frontend/features/account/screens/account_screen.dart';
import 'package:amazon_frontend/features/admin/screens/add_product_screen.dart';
import 'package:amazon_frontend/features/admin/screens/admin_screen.dart';
import 'package:amazon_frontend/features/admin/screens/products_screen.dart';
import 'package:amazon_frontend/features/auth/screens/auth_screen.dart';
import 'package:amazon_frontend/core/errors/errors.dart';
import 'package:amazon_frontend/features/cart/screens/cart_screen.dart';
import 'package:amazon_frontend/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const AuthScreen(),
        settings: settings,
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const BottomBar(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
        settings: settings,
      );
    case AccountScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext cotnext) => const AccountScreen(),
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const CartScreen(),
      );
    case AdminScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const AdminScreen(),
      );
    case ProductsScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const ProductsScreen(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const AddProductScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const PageNotFoundScreen(),
      );
  }
}
