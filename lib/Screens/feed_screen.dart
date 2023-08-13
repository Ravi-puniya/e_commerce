import 'package:flutter/material.dart';

import '../Models/product_one.dart';
import '../helper/services.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool isLoading = true;
  List<ModelOne> dataome = [];

  Future getData() async {
    List<ModelOne> res = await HelperApi().getDataOne();

    dataome = res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: HelperApi().getDataOne(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            print(snapshot.data);
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: dataome.length,
                itemBuilder: (context, index) {
                  return GridTile(
                      child: Container(
                    child: Image.network(dataome[index].image!),
                  ));
                });
          } else {
            return Center(child: Text('${dataome[1].category}'));
          }
        },
      ),
    );
  }
}
