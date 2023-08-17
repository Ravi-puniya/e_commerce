import 'package:e_commerce/Models/product_one.dart';
import 'package:e_commerce/Models/shoe_model.dart';
import 'package:e_commerce/Utils/app_style.dart';
import 'package:e_commerce/Widget/product_card.dart';

import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Shoemodel>> male,
    required this.tabindex,
  }) : _male = male;

  final Future<List<Shoemodel>> _male;

  final int tabindex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: FutureBuilder(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final data = snapshot.data;
                    return GestureDetector(
                      onTap: () {},
                      child: ProductCard(
                        price: data![index].price,
                        category: data![index].category,
                        id: data[index].id,
                        name: data[index].name,
                        image: data[index].imageUrl[0],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
       
      ],
    );
  }
}
