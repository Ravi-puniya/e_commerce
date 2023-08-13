import 'package:flutter/material.dart';


class CustomTextWidget extends StatelessWidget {
  String text;
  double size;
  FontWeight weight;
  Color color;
   CustomTextWidget({super.key, required this.color,required this.size,required this.text,required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
     text ,style: TextStyle(
        fontSize:size ,
        color: color,
        fontWeight: weight
      ),
    );
  }
}