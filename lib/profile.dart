import 'package:belajar/saran.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'convert_currency.dart';
import 'convert_time.dart';
import 'feedback.dart';
import 'home.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: ClipOval(
                  child: Image.asset(
                      'assets/image/ariq.jpg'
                  ),
                ),
                //tmpt foto
              ),
              SizedBox(
                height: 20,
              ),
              Text("NAMA : "),
              Text("Muhammad Ariq Devandi"),
              SizedBox(
                height: 10,
              ),
              Text("NIM : "),
              Text("124210048"),
              SizedBox(
                height: 10,
              ),
              Text("TEMPAT TANGGAL LAHIR : "),
              Text("    Bandarlampung, 04 Agustus 2003    "),
              SizedBox(
                height: 10,
              ),
              Text("HOBI : "),
              Text("menggambar"),
              SizedBox(
                height: 20,
              )
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Navigate to different screens based on index
            if (_currentIndex == 0) {
              // Navigate to the Login screen
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }
            ;

            if (_currentIndex == 1) {
              // Navigate to the Login screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CurrencyConverter()));
            }
            ;

            if (_currentIndex == 2) {
              // Navigate to the Login screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TimeConverter()));
            }
            ;
            if (_currentIndex == 3) {
              // Navigate to the Login screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            }
            ;
            if (_currentIndex == 4) {
              // Navigate to the Login screen
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Saran()));
            }
            ;
            if (_currentIndex == 5) {
              // Navigate to the Login screen
              _logout();
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'list buku',
              backgroundColor: Colors.brown[300]),
          BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'uang',
              backgroundColor: Colors.brown[300]),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'waktu',
              backgroundColor: Colors.brown[300]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
              backgroundColor: Colors.brown[300]),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'kesan',
              backgroundColor: Colors.brown[300]),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'logout',
              backgroundColor: Colors.brown[300]),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    // Clear the username from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('login');

    // Navigate to the login page and remove the previous routes from the stack
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
