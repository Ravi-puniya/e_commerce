import 'package:e_commerce/Screens/home_screen.dart';
import 'package:e_commerce/auth/vaid_form_widget.dart';
import 'package:flutter/material.dart';

import '../Widget/button_widget.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            const Text(
              'Verify you Mobile Number',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Enter your 4-digit code to verify',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              height: 15,
            ),
            const Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  vaidFromInputbox(),
                  vaidFromInputbox(),
                  vaidFromInputbox(),
                  vaidFromInputbox(),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'Resend',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ButtonWidget(
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
                },
                alignment: Alignment.center,
                decColor: Colors.red,
                horiztal: 10,
                radius: 25,
                text: 'Verify',
                textcolor: Colors.white,
                vertical: 16,
                width: double.infinity,
                isborder: false,
                fontsize: 16,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
