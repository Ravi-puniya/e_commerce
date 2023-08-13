import 'package:e_commerce/Widget/button_widget.dart';
import 'package:e_commerce/auth/verification_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55,
            ),
            Text(
              'Clavi',
              style: TextStyle(shadows: [
                Shadow(blurRadius: 2, color: Colors.black, offset: Offset(0, 2))
              ], color: Colors.red, fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Let's get started",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "We are going to send you a verification code to make sure it's you",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  border: InputBorder.none,
                  hintText: 'Phone Number'),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonWidget(
              ontap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VerificationPage(),
                ));
              },
              alignment: Alignment.center,
              decColor: Colors.red,
              horiztal: 10,
              radius: 25,
              text: 'Continue',
              textcolor: Colors.white,
              vertical: 16,
              width: double.infinity,
              isborder: false,
              fontsize: 16,
              weight: FontWeight.w600,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Or'),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  ontap: () {},
                  radius: 25,
                  isborder: true,
                  alignment: Alignment.center,
                  decColor: Colors.white,
                  horiztal: 10,
                  text: 'Continue with Apple',
                  textcolor: Colors.black,
                  vertical: 16,
                  width: double.infinity,
                  weight: FontWeight.bold,
                  fontsize: 16,
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  ontap: () {},
                  radius: 25,
                  isborder: true,
                  alignment: Alignment.center,
                  decColor: Colors.white,
                  horiztal: 10,
                  text: 'Continue with Google',
                  textcolor: Colors.black,
                  vertical: 16,
                  width: double.infinity,
                  weight: FontWeight.bold,
                  fontsize: 16,
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Continue without Login',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.red.shade400)),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
