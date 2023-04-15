import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_ui/screens/home/homepage.dart';

// import '../home.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Leisure",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "Diary",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 42, 42, 43),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        elevation: 0.0,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Text(' Power Fuel Station',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: const Text(
                'Home',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //
      // ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                    image: AssetImage('assets/images/profile-pic.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Lionel Messi',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'Colombo Fuel Station',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            Text(
              '12345687893',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Edit profile',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Menu
            MenuWidget(
              title: "Settings",
              icon: Icons.account_circle,
              onPress: () {},
              endIcon: true,
            ),
            MenuWidget(
              title: "Fuel station details",
              icon: Icons.article_rounded,
              onPress: () {},
              endIcon: true,
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            MenuWidget(
              title: "Logout",
              icon: Icons.logout_rounded,
              textColor: Colors.red,
              onPress: () {},
              endIcon: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );

          // Add your onPressed code here!
        },
        label: const Text('Home'),
        icon: const Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.endIcon,
    this.textColor,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final bool endIcon;
  final Color? textColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
            ?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.navigate_next,
              ),
            )
          : null,
    );
  }
}
