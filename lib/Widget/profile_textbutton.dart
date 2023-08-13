import 'package:e_commerce/Widget/text_widget.dart';
import 'package:flutter/material.dart';

class profileTextButton extends StatelessWidget {
  
  String assetsdir;
  VoidCallback ontap;
  String text;
  double height;
  double size;
  FontWeight weight;
  Color color;

  profileTextButton(
      {super.key,
      required this.assetsdir,
      required this.height,
      required this.color,
     
      required this.ontap,
      required this.size,
      required this.text,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      child: Row(
        children: [
          Image.asset(assetsdir,height:height ),
          SizedBox(
            width: 10,
          ),
          CustomTextWidget(color: color, size: size, text: text, weight: weight)
        ],
      ),
    );
  }
}
