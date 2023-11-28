import 'package:belajar/convert_currency.dart';
import 'package:belajar/profile.dart';
import 'package:belajar/saran.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feedback.dart';
import 'home.dart';
import 'login.dart';
import 'package:intl/intl.dart';


class TimeConverter extends StatefulWidget {
  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  int _currentIndex = 2;
  final List<Widget> _screens = [
    Home(),
    CurrencyConverter(),
    TimeConverter(),
    FeedbackForm(),
    ProfilePage(),
    // Add your Log Out screen here
  ];

  DateTime _selectedTime = DateTime.now();

  String _formatTime(DateTime time, String timeZone) {
    return DateFormat('HH:mm:ss', 'en_US')
        .add_jm()
        .format(time.toUtc())
        .toString() +
        ' $timeZone';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        title: Text('Time Converter'),
        backgroundColor: Colors.brown[500],
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Card(
            color: Colors.brown[500],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Waktu yang dipilih:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _formatTime(_selectedTime, 'UTC'),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedTime =
                              _selectedTime.toUtc().add(Duration(hours: 7));
                        });
                      },
                      child: Text('WIB'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedTime =
                              _selectedTime.toUtc().add(Duration(hours: 8));
                        });
                      },
                      child: Text('WITA'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedTime =
                              _selectedTime.toUtc().add(Duration(hours: 9));
                        });
                      },
                      child: Text('WIT'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedTime = DateTime.now();
                        });
                      },
                      child: Text('Refresh \nTime', textAlign: TextAlign.center),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  'Waktu London:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _formatTime(_selectedTime, 'GMT'),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
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
                  context,
                  MaterialPageRoute(builder: (context) => Home()));
            };

            if (_currentIndex == 1) {
              // Navigate to the Login screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrencyConverter()));
            };

            if (_currentIndex == 2) {
              // Navigate to the Login screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimeConverter()));
            };
            if (_currentIndex == 3) {
              // Navigate to the Login screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            };
            if (_currentIndex == 4) {
              // Navigate to the Login screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Saran()));
            };
            if (_currentIndex == 5) {
              // Navigate to the Login screen
              _logout();
            };

          });
        },
        items: [

          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'list buku',
              backgroundColor: Colors.brown[300]
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'uang',
              backgroundColor: Colors.brown[300]
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'waktu',
              backgroundColor: Colors.brown[300]
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
              backgroundColor: Colors.brown[300]
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'kesan',
              backgroundColor: Colors.brown[300]
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'logout',
              backgroundColor: Colors.brown[300]
          ),
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