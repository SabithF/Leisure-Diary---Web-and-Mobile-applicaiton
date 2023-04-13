import 'package:flutter/material.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/screens/home/components/bottombar.dart';
import 'package:travel_app_ui/screens/home/components/categories.dart';
import 'package:travel_app_ui/screens/home/components/search_form.dart';
import 'package:travel_app_ui/screens/home/components/specialcard.dart';
import 'package:travel_app_ui/screens/home/components/swiper.dart';
import 'package:travel_app_ui/utils/bottom_glass.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: const BottomGlassBox(
        child: BottomBar(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 35),
          const Searchform(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'Leisure Diary',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Categories(),
                  const SizedBox(height: 25),
                  const SwipeCard(),
                  const SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'Special Offer',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const SpecialCard(),
                  const SizedBox(height: 100),
                  const SwipeCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
