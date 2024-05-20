import 'package:amazon_frontend/core/common/widget.dart';
import 'package:amazon_frontend/core/constant/app_color.dart';
import 'package:amazon_frontend/core/constant/app_data.dart';
import 'package:flutter/material.dart';

class AccountOrders extends StatefulWidget {
  const AccountOrders({super.key});

  @override
  State<AccountOrders> createState() => _AccountOrdersState();
}

class _AccountOrdersState extends State<AccountOrders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See All",
                style: TextStyle(
                  fontSize: 17,
                  color: AppColor.selectedNavBarColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          height: 170,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: ListView.builder(
            itemCount: AppData.carouselImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SingleProduct(
                image: AppData.carouselImages[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
