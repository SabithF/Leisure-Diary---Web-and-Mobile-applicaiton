import 'package:flutter/material.dart';

class Accomodation {
  final String? serviceProvider;
  final String? title;
  final String? description;
  final String? otherdesc;
  final String? location;
  final String? image;
  final String? price;
  final String? category;
  final String? phone;
  final String? startDate;
  final String? endDate;

  Accomodation(
      {this.serviceProvider,
      this.title,
      this.description,
      this.otherdesc,
      this.location,
      this.image,
      this.price,
      this.category,
      this.phone,
      this.startDate,
      this.endDate});

  // factory Accomodation.fromJson(Map<String, dynamic> json) {
  //   return Accomodation(
  //     serviceProvider: json['serviceProvider'],
  //     title: json['title'],
  //     description: json['description'],
  //     otherdesc: json['otherdesc'],
  //     location: json['location'],
  //     image: json['image'],
  //     price: json['price'],
  //     category: json['category'],
  //     phone: json['phone'],
  //     startDate: json['startDate'],
  //     endDate: json['endDate'],
  //   );
  // }
//   required
// required
// required
// required
// required
// required
// required
// required
// required
// required
// required
}
