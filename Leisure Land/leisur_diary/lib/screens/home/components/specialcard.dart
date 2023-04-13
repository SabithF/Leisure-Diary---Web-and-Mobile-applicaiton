// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:travel_app_ui/models/specialoffer.dart';
import 'package:travel_app_ui/screens/details/specialdetails.dart';

import '../../../constants.dart';
import '../../../utils/glass_box.dart';

class SpecialCard extends StatefulWidget {
  const SpecialCard({super.key});

  @override
  State<SpecialCard> createState() => _SpecialCardState();
}

class _SpecialCardState extends State<SpecialCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Swiper(
        itemCount: specialoffers.length,
        itemHeight: MediaQuery.of(context).size.height / 2.7,
        itemWidth: MediaQuery.of(context).size.width / 1.2,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          return Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: greyColor,
                image: DecorationImage(
                  image: AssetImage(specialoffers[index].image),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 22,
                          width: MediaQuery.of(context).size.width / 4.5,
                          // padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            '20% Off',
                            style: TextStyle(
                              // fontSize:15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Container(
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
                      ],
                    ),
                  ),
                  glassBoxx(context, index),
                ],
              ));
        },
      ),
    );
  }
}

SizedBox glassBoxx(BuildContext context, int index) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 10,
    child: Material(
      color: Colors.transparent,
      elevation: 0.1,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.circular(50),
      child: GlassBox(
        radius: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                top: 17,
                bottom: 17,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$${specialoffers[index].price}\\',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Per Person',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
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
                        specialoffers[index].location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 15, bottom: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return SpecialDetails(
                          specialOffers: specialoffers[index],
                        );
                      },
                    ),
                  );
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.grey.shade400),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(backgroundColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width / 3.3,
                      MediaQuery.of(context).size.height / 2.5,
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
  );
}
