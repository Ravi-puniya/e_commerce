import 'package:e_commerce/Utils/app_style.dart';
import 'package:flutter/material.dart';



class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image});
  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // final _favBox = Hive.box('fav-box');

  // Future<void> _createfav(Map<String, dynamic> addfav) async {
  //   await _favBox.add(addfav);
  //   getFav();
  // }

  // getFav() {
  //   final favData = _favBox.keys.map((e) {
  //     final item = _favBox.get(e);
  //     return {
  //       "key": e,
  //       "id": "id",
  //     };
  //   }).toList();
  //   favour = favData.toList();
  //   ids = favour.map((e) => e['id']).toList();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black26, offset: Offset(1, 1))
          ]),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(widget.image))),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: 
                             Icon(Icons.favorite_border_outlined)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: appStyle(36, Colors.black, FontWeight.bold)),
                    Text(
                      widget.category,
                      style: appStyle(18, Colors.grey, FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.price,
                      style: appStyle(18, Colors.black, FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Colors',
                        style: appStyle(18, Colors.grey, FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ChoiceChip(
                        label: const Text(''),
                        selected: selected,
                        visualDensity: VisualDensity.compact,
                        selectedColor: Colors.black,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
