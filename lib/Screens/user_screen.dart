import 'package:e_commerce/Widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../Widget/profile_textbutton.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomTextWidget(
              color: Colors.black,
              size: 19,
              text: 'Profile',
              weight: FontWeight.w600),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                            color: Colors.black,
                            size: 15,
                            text: 'UserName',
                            weight: FontWeight.w500),
                        CustomTextWidget(
                            color: Colors.black,
                            size: 15,
                            text: 'username@gmail.com',
                            weight: FontWeight.w500)
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              Divider(),
              Column(
                children: [
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/shopping-bag.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'My Order',
                    weight: FontWeight.w500,
                  ),
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/wishlist.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'Wishlist',
                    weight: FontWeight.w500,
                  ),
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/home.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'Compare',
                    weight: FontWeight.w500,
                  ),
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/history.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'Browsing History',
                    weight: FontWeight.w500,
                  ),
                  Divider(),
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/home.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'Save Address',
                    weight: FontWeight.w500,
                  ),
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/operation.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'Payments',
                    weight: FontWeight.w500,
                  ),
                  Divider(),
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/delivery.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'Shipping and Payment',
                    weight: FontWeight.w500,
                  ),
                  profileTextButton(
                    color: Colors.black,
                    assetsdir: 'assets/icons/insurance.png',
                    height: 20,
                    ontap: () {},
                    size: 15,
                    text: 'Refund Policy',
                    weight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
