import 'package:amazon_frontend/core/constant/app_color.dart';
import 'package:amazon_frontend/features/account/screens/account_screen.dart';
import 'package:amazon_frontend/features/cart/screens/cart_screen.dart';
import 'package:amazon_frontend/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/shared-home';

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int pageIndex) {
          setState(() {
            _currentIndex = pageIndex;
          });
        },
        selectedItemColor: AppColor.selectedNavBarColor,
        unselectedItemColor: AppColor.unselectedNavBarColor,
        iconSize: 27,
        backgroundColor: AppColor.backgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              width: 42,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _currentIndex == 0
                        ? AppColor.selectedNavBarColor
                        : AppColor.backgroundColor,
                    width: 3,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 42,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _currentIndex == 1
                        ? AppColor.selectedNavBarColor
                        : AppColor.backgroundColor,
                    width: 3,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 42,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _currentIndex == 2
                        ? AppColor.selectedNavBarColor
                        : AppColor.backgroundColor,
                    width: 3,
                  ),
                ),
              ),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
