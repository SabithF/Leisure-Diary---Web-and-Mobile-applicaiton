import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/AccomModel.dart';

class Api {
  static getServices() async {
    List<Accomodation> accomodations = [];

    var url = Uri.parse('http://192.168.8.188/api/getAccomodations');

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        // print('res.body ${data}');

        data['accomodations'].forEach((value) => {
              accomodations.add(Accomodation(
                  serviceProvider: value['serviceProvider'].toString(),
                  title: value['title'].toString(),
                  description: value['description'].toString(),
                  otherdesc: value['otherdesc'].toString(),
                  location: value['location'].toString(),
                  image: value['image'].toString(),
                  price: value['price'].toString(),
                  category: value['category'].toString(),
                  phone: value['phone'].toString(),
                  startDate: value['startDate'].toString(),
                  endDate: value['endDate'].toString()))
            });
        return accomodations;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      print('Errorrrrrrrrrrrrrrr');
    }
  }
}
