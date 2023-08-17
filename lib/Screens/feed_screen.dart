import 'package:e_commerce/Screens/product_screen.dart';
import 'package:e_commerce/Utils/app_style.dart';
import 'package:e_commerce/Widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../Models/product_one.dart';
import '../Models/shoe_model.dart';
import '../Widget/home_widget.dart';
import '../helper/helper.dart';
import '../helper/services.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  bool isLoading = true;
  late Future<List<Shoemodel>> _male;
  late Future<List<Shoemodel>> _female;
  late Future<List<Shoemodel>> _kids;
  late Future<List<ModelOne>> _res;

  List<ModelOne> dataome = [];

  void getmale() {
    _male = Helper().getMaleSneaker();
  }

  void getfemale() {
    _female = Helper().getFemaleSneaker();
  }

  void getkids() {
    _kids = Helper().getKidsSneaker();
  }

  @override
  void initState() {
    getData();
    getmale();
    getfemale();
    getkids();
    super.initState();
  }

  void getData() {
    _res = HelperApi().getDataOne();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            controller: tabController,
            padding: EdgeInsets.only(bottom: 10),
            dividerColor: Colors.red,
            indicatorColor: Colors.red,
            labelColor: Colors.black,
            labelPadding: EdgeInsets.only(bottom: 5),
            tabs: [
              Text('Men Shoes'),
              Text('Women Shoes'),
              Text('Kids Shoes'),
            ]),
        toolbarHeight: 140,
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                  height: 210,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      HomeWidget(
                        male: _male,
                        tabindex: 0,
                      ),
                      HomeWidget(
                        male: _female,
                        tabindex: 1,
                      ),
                      HomeWidget(
                        male: _kids,
                        tabindex: 0,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 12, 2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Items',
                            style: appStyle(20, Colors.black, FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  modelOne: _res,
                                ),
                              ));
                            },
                            child: Text(
                              'ShowAll >',
                              style:
                                  appStyle(20, Colors.black, FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _res,
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
                                  crossAxisCount: 2),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            final data = snapshot.data;
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(6),
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(1, 1))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        child: Image.network(
                                          data![index].image!,
                                          fit: BoxFit.contain,
                                          filterQuality: FilterQuality.medium,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data[index].title!,
                                      softWrap: true,
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
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
            ),
          ),
        ),
      ),
    );
  }
}
