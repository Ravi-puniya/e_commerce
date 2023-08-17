import 'package:flutter/services.dart' as the_bundel;

import '../Models/shoe_model.dart';

class Helper {
  //male

  Future<List<Shoemodel>> getMaleSneaker() async {
    final data =
        await the_bundel.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = await shoemodelFromJson(data);

    return maleList;
  }

  // female

  Future<List<Shoemodel>> getFemaleSneaker() async {
    final data =
        await the_bundel.rootBundle.loadString("assets/json/women_shoes.json");

    final womenList = shoemodelFromJson(data);
    return womenList;
  }

  //kids

  Future<List<Shoemodel>> getKidsSneaker() async {
    final data =
        await the_bundel.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidList = shoemodelFromJson(data);
    return kidList;
  }

  // Single Male shoes
  Future<Shoemodel> getMaleSneakerById(String id) async {
    final data =
        await the_bundel.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = shoemodelFromJson(data);
    final sneaker = maleList.firstWhere((snekers) => snekers.id == id);
    return sneaker;
  }

  // Single Female shoes
  Future<Shoemodel> getFemaleSneakerById(String id) async {
    final data =
        await the_bundel.rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = shoemodelFromJson(data);
    final sneaker = femaleList.firstWhere((snekers) => snekers.id == id);
    return sneaker;
  }

  // Single Kids shoes
  Future<Shoemodel> getKidesSneakerById(String id) async {
    final data =
        await the_bundel.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = shoemodelFromJson(data);
    final sneaker = kidsList.firstWhere((snekers) => snekers.id == id);
    return sneaker;
  }
}
