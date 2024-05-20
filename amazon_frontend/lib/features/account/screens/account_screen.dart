import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:amazon_frontend/features/account/widgets/account_top_buttons.dart';
import 'package:amazon_frontend/features/account/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';

  const AccountScreen({super.key});

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
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          AccountBelowAppBar(),
          SizedBox(height: 10),
          AccountTopButtons(),
          SizedBox(height: 20),
          AccountOrders(),
        ],
      ),
    );
  }
}
