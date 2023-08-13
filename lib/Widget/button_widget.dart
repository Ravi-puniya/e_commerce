import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Alignment alignment;
  Color textcolor;
  Color decColor;
  String text;
  double vertical;
  double horiztal;
  double width;
  double radius;
  bool isborder;
  FontWeight weight;
  double fontsize;
  VoidCallback ontap;

  ButtonWidget(
      {super.key,
      required this.ontap,
      required this.radius,
      required this.isborder,
      required this.fontsize,
      required this.weight,
      required this.alignment,
      required this.decColor,
      required this.horiztal,
      required this.text,
      required this.textcolor,
      required this.vertical,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: alignment,
        width: width,
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horiztal),
        decoration: BoxDecoration(
          border: isborder? Border.all(width: .5) : null,
          color: decColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          text,
          style: TextStyle(color: textcolor,fontSize:fontsize,fontWeight: weight),
        ),
      ),
    );
  }
}
