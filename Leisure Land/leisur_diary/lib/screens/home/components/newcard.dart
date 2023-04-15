import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/AccomModel.dart';
import '../../../models/places.dart';
import '../../../services/accomodationServices.dart';
import '../../../utils/glass_box.dart';
import '../../details/detailspage.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({super.key});

  @override
  State<ServiceCard> createState() => ServiceCardState();
}

class ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
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
                    itemCount: aData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            color: greyColor,
                            image: DecorationImage(
                              image: AssetImage(places[index].image),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.all(10),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // glassBoxx(context, index),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.1,
                                  shadowColor: Colors.black54,
                                  borderRadius: BorderRadius.circular(50),
                                  child: GlassBox(
                                    radius: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25.0,
                                            top: 17,
                                            bottom: 17,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      '\$${aData[index].title}\\',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: 'Per Person',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_rounded,
                                                    color: Colors.white,
                                                    size: 17,
                                                  ),
                                                  Text(
                                                    '${aData[index].location}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12, top: 15, bottom: 15),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                    places: places[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            style: ButtonStyle(
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.grey.shade400),
                                              elevation:
                                                  MaterialStateProperty.all(
                                                      0.0),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      backgroundColor),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                Size(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.3,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2.5,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              'Take a look',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}
// SizedBox glassBoxx(BuildContext context, int index) {
//   return 



