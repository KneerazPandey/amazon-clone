import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:amazon_frontend/core/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountBelowAppBar extends StatelessWidget {
  const AccountBelowAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColor.appBarGradient,
      ),
      padding: const EdgeInsets.all(10),
      child: RichText(
        text: TextSpan(
          text: 'Hello, ',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: user.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
