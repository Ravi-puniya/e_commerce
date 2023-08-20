import 'package:e_commerce/Models/product_one.dart';
import 'package:e_commerce/Screens/product_detail_screen.dart';

import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final Future<List<ModelOne>> modelOne;
  const ProductScreen({super.key, required this.modelOne});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
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
              prefixIcon: Icon(Icons.search),
              hintText: 'Search Item'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: FutureBuilder(
          future: modelOne,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 2.7),
              itemBuilder: (context, index) {
                final data = snapshot.data;
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetail(
                        one: data[index],
                      ),
                    ));
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                            data![index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          data[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '\$ ${data[index].price!.toString()}',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 10, top: 10),
                                child: Icon(Icons.shopping_bag),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
