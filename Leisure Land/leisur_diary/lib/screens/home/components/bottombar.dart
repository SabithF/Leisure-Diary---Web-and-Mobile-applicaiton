import 'package:flutter/material.dart';
import 'package:travel_app_ui/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentBottomindex = 0;
  void _handleBottomIndexChange(int? index) {
    setState(() {
      _currentBottomindex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentBottomindex,
      onTap: _handleBottomIndexChange,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: primaryColor,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: primaryColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/home.png',
            scale: 1.2,
            color: primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/explore.png',
            scale: 1.2,
            color: primaryColor,
          ),
          label: 'Explore',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite,size: 30),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/search.png',
            scale:1.8,
            color: primaryColor,
          ),
          label: 'Search',
        ),
      ],
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return GNav(
  //     selectedIndex: _currentBottomindex,
  //     onTabChange: _handleBottomIndexChange,
  //     iconSize: 30,
  //     textSize: 15,
  //     textStyle: TextStyle(fontWeight: FontWeight.bold),
  //     tabBackgroundColor: Colors.white,
  //     tabBorderRadius: 40,
  //     color: primaryColor,
  //     activeColor: primaryColor,
  //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  //     style: GnavStyle.oldSchool,
  //     backgroundColor: Colors.transparent,
  //     tabs: [
  //       GButton(
  //         icon: Icons.home_rounded,
  //         text: 'Home',
  //       ),
  //       GButton(
  //         icon: Icons.explore_rounded,
  //         text: 'Explore',
  //       ),
  //       GButton(
  //         icon: Icons.favorite_rounded,
  //         text: 'Saved',
  //       ),
  //       GButton(
  //         icon: Icons.search_rounded,
  //         text: 'Search',
  //       ),
  //     ],
  //   );
  // }
}
