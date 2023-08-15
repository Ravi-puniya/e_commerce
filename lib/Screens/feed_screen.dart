import 'package:e_commerce/Widget/product_card.dart';
import 'package:e_commerce/Widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../Models/product_one.dart';
import '../helper/services.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  bool isLoading = true;

  List<ModelOne> dataome = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    List<ModelOne> res = await HelperApi().getDataOne();

    dataome = res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: tabController, tabs: [
          Text('Men Shoes'),
          Text('Women Shoes'),
          Text('Kids Shoes'),
        ]),
        toolbarHeight: 107,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                child: CustomTextWidget(
                    color: Colors.red,
                    size: 24,
                    text: 'Clavi',
                    weight: FontWeight.bold),
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
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search Item'),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      height: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 100,
                      color: Colors.yellow,
                    ),
                    Container(height: 100, color: Colors.green)
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: HelperApi().getDataOne(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 40 / 52,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemCount: dataome.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              price: dataome[index].price.toString(),
                              category: dataome[index].category!.toString(),
                              id: dataome[index].id!,
                              name: dataome[index].title!.toString(),
                              image: dataome[index].image!,
                            );
                          });
                    } else {
                      return Center(child: Text('${dataome[1].category}'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
