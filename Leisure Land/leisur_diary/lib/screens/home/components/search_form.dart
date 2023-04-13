import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app_ui/constants.dart';

class Searchform extends StatelessWidget {
  const Searchform({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Form(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Where to?',
            // filled: true,
            // fillColor: Colors.grey.shade100,
            hintStyle: TextStyle(
              color: primaryColor,
              // fontWeight: FontWeight.w600,
              // fontSize: 15,
            ),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
                color: primaryColor,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 7.0, bottom: 1, top: 1),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/Filter.svg',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(
    Radius.circular(30),
  ),
  borderSide: BorderSide(
    width: 0.3,
    color: primaryColor,
  ),
);
