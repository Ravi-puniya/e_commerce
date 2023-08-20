import 'package:e_commerce/Models/product_one.dart';
import 'package:e_commerce/Widget/button_widget.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  ModelOne one;
  
  ProductDetail({super.key, required this.one, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 350,
                  child: Image.network(one.image!),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  one.title!,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${one.price!}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                              )),
                        ),
                      ),
                      ButtonWidget(
                        ontap: () {},
                        alignment: Alignment.center,
                        decColor: Colors.red,
                        horiztal: 10,
                        radius: 29,
                        text: 'Add to cart',
                        textcolor: Colors.white,
                        vertical: 5,
                        width: 120,
                        isborder: false,
                        fontsize: 16,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    one.description!,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
