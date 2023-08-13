import 'package:e_commerce/Widget/button_widget.dart';
import 'package:e_commerce/Widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../Widget/profile_textbutton.dart';
import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
            color: Colors.black,
            size: 20,
            text: 'My cart',
            weight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            Image.asset('assets/images/self-confidence.png'),
            CustomTextWidget(
                color: Colors.black45,
                size: 25,
                text: 'Your cart is empty',
                weight: FontWeight.w300),
            SizedBox(
              height: 10,
            ),
            ButtonWidget(
              ontap: () {},
              alignment: Alignment.center,
              decColor: Colors.red,
              horiztal: 10,
              radius: 25,
              text: 'Browese Items',
              textcolor: Colors.white,
              vertical: 16,
              width: 160,
              isborder: false,
              fontsize: 16,
              weight: FontWeight.w600,
            ),
            Spacer(),
            Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27)),
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/home.png', height: 20),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextWidget(
                          color: Colors.black,
                          size: 15,
                          text: "Save Address",
                          weight: FontWeight.w400)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27)),
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/operation.png', height: 20),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextWidget(
                          color: Colors.black,
                          size: 15,
                          text: "Payments",
                          weight: FontWeight.w400)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
