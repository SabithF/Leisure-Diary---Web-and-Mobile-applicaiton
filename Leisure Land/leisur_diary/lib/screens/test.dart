// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

import '../models/AccomModel.dart';
import '../services/accomodationServices.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);

    // fetchAccomodations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Testing'),
        ),
        body: FutureBuilder(
            future: Api.getServices(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Accomodation> aData = snapshot.data;

                return ListView.builder(
                    controller: scrollController,
                    itemCount: aData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text('${aData[index].title}'),
                          subtitle: Text('${aData[index].description}'),
                        ),
                      );
                    });
              }
            }));
  }

  void _scrollListener() {
    print('Scroll Listener Called');
  }
  // Future<void> fetchServices() async {
  //   final response = await ServiceAccom.fetchServices();
  //   if (response != null) {
  //     setState(() {
  //       services = response;
  //     });
  //   } else {
  //     print('Something went wrong');
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
}


 // List<Accomodation> _accomodation = [];

  // Future<void> fetchAccomodations() async {
  //   final response =
  //       await http.get(Uri.parse('http://localhost:5000/api/getAccomodations'));

  //   if (response.statusCode == 200) {
  //     final jsonData = jsonDecode(response.body);
  //     final servicesList = <Accomodation>[];

  //     for (var item in jsonData) {
  //       final service = Accomodation.fromJson(item);
  //       servicesList.add(service);
  //     }

  //     setState(() {
  //       _accomodation = servicesList;
  //     });
  //   } else {
  //     throw Exception('Failed to fetch services');
  //   }
  // }