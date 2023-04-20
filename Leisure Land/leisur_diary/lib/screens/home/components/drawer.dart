import 'package:flutter/material.dart';

import '../../profile/profile.dart';
import '../../test.dart';
import '../homepage.dart';
import 'newcard.dart';

class DrawerWid extends StatelessWidget {
  const DrawerWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Text(' Leisure Diary',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              )),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          title: const Text('Settings',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              )),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ServiceCard(),
            ));
          },
        ),
        SizedBox(
          height: 5,
        ),
        ListTile(
          title: const Text('Home',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              )),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TestPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Logout',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.red,
              )),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TestPage()),
            );
          },
        ),
      ],
    );
  }
}
