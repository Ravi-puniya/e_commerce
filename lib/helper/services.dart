import 'dart:convert';

import 'package:e_commerce/Models/product_one.dart';
import 'package:http/http.dart' as http;

class HelperApi {
  Future<List<ModelOne>> getDataOne() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    List<dynamic> decode = jsonDecode(response.body);

    return decode.map((e) => ModelOne.fromJson(e)).toList();
  }
}
