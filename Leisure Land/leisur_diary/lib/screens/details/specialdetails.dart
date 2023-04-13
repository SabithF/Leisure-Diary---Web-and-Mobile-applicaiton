import 'package:flutter/material.dart';

import 'package:travel_app_ui/models/specialoffer.dart';

import '../../constants.dart';
import '../../utils/glass_box.dart';

class SpecialDetails extends StatelessWidget {
  final SpecialOffers specialOffers;
  const SpecialDetails({
    Key? key,
    required this.specialOffers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height / 1.9,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(specialOffers.image),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black.withOpacity(0.2),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black.withOpacity(0.2),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  specialOffers.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: greyColor,
                                      size: 18,
                                    ),
                                    Text(
                                      specialOffers.location,
                                      style: TextStyle(color: greyColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 11,
                              width: MediaQuery.of(context).size.width / 3.5,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(specialOffers.image),
                                ),
                              ),
                              child: Material(
                                elevation: 0.1,
                                shadowColor: Colors.black54,
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                                child: const GlassBox(
                                  radius: 50,
                                  child: Text(
                                    'Veiw map',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // alignment: Alignment.center,
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          specialOffers.info,
                          style: TextStyle(
                            color: greyColor,
                            fontWeight: FontWeight.bold,
                            height: 2,
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: defaultPadding,
                bottom: defaultPadding / 2,
                left: defaultPadding,
                right: defaultPadding,
              ),
              color: backgroundColor,
              height: MediaQuery.of(context).size.height / 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${specialOffers.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        '\\Per person',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
                    height: MediaQuery.of(context).size.height / 15,
                    minWidth: MediaQuery.of(context).size.width / 1.9,
                    textColor: Colors.white,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
