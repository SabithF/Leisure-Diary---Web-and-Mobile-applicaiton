import 'package:flutter/material.dart';

import '../../../utils/consts/imageStrings.dart';

class loginHead extends StatelessWidget {
  const loginHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(tMainLogo),
          ),
        ),
        Text(
          'Welcome back to Leisure Diary',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
