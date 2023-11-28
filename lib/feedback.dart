import 'package:belajar/convert_currency.dart';
import 'package:belajar/convert_time.dart';
import 'package:belajar/profile.dart';
import 'package:belajar/saran.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feedback_model.dart';
import 'home.dart';
import 'login.dart';
import 'package:hive/hive.dart';


class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  late int _currentIndex = 4;
  final List<Widget> _screens = [
    Home(),
    CurrencyConverter(),
    TimeConverter(),
    FeedbackForm(),
    ProfilePage(),
  ];

  final TextEditingController _saranController = TextEditingController();
  final TextEditingController _kesanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        title: Text('Form Saran dan Kesan'),
        backgroundColor: Colors.brown[500],
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Saran()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Saran:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            TextField(
              style: TextStyle(
                  color: Colors.white
              ),
              controller: _saranController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Masukkan saran Anda...',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
              ),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 16.0),
            Text(
              'Kesan:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            TextField(
              style: TextStyle(
                color: Colors.white
              ),
              controller: _kesanController,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: 'Masukkan kesan Anda...',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  hintStyle: TextStyle(
                      color: Colors.white
                  )
              ),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                submitFeedback();
              },
              child: Text('Kirim'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black!)
              ),
            ),
          ],
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

  void submitFeedback() async {
    try {
      // Buka Hive box untuk feedback
      var feedbackBox = await Hive.openBox<FeedbackModel>('feedback');

      // Buat objek FeedbackModel dari data yang dimasukkan
      FeedbackModel feedback = FeedbackModel(
        saran: _saranController.text,
        kesan: _kesanController.text,
      );

      // Simpan objek FeedbackModel ke dalam Hive box
      await feedbackBox.add(feedback);

      // Tampilkan pesan sukses atau lakukan sesuatu yang lain
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Form berhasil disubmit.'),
            backgroundColor: Colors.green,
          )
      );
      print('Feedback berhasil disimpan ke dalam Hive box.');
      _saranController.clear();
      _kesanController.clear();
    } catch (e) {
      // Handle error jika ada
      print('Error: $e');
    }
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