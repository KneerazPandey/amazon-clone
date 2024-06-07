import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:amazon_frontend/features/admin/screens/products_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/admin';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const ProductsScreen(),
    const Center(
      child: Text('Second'),
    ),
    const Center(
      child: Text('Third'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppColor.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              const Row(
                children: <Widget>[
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: screens[_currentIndex],
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
