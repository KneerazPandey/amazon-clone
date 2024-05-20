import 'package:amazon_frontend/core/common/widget.dart';
import 'package:flutter/material.dart';

class AccountTopButtons extends StatefulWidget {
  const AccountTopButtons({super.key});

  @override
  State<AccountTopButtons> createState() => _AccountTopButtonsState();
}

class _AccountTopButtonsState extends State<AccountTopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            AccountButton(onPressed: () {}, text: 'Your Orders'),
            AccountButton(onPressed: () {}, text: 'Turn Seller'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            AccountButton(onPressed: () {}, text: 'Log Out'),
            AccountButton(onPressed: () {}, text: 'Your Wish List'),
          ],
        ),
      ],
    );
  }
}
