import 'package:belajar/feedback_model.dart';
import 'package:belajar/profile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'convert_currency.dart';
import 'convert_time.dart';
import 'feedback.dart';
import 'home.dart';
import 'login.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saran dan Kesan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Saran(),
    );
  }
}

class Saran extends StatefulWidget {
  @override
  _SaranState createState() => _SaranState();
}

class _SaranState extends State<Saran> {
  late int _currentIndex = 4;
  List<String> feedbackList = [];
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        title: Text('Saran dan Kesan'),
        backgroundColor: Colors.brown[500],
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackForm()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable:
                      Hive.box<FeedbackModel>('feedback').listenable(),
                  builder: (context, Box<FeedbackModel> box, _) {
                    if (box.values.isEmpty) {
                      return Center(
                        child: Text(
                          'Feedback is empty.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        FeedbackModel? feedback = box.getAt(index);
                        return Card(
                          elevation: 3,
                          color: Colors.brown[100],
                          margin: EdgeInsets.all(6),
                          child: ListTile(
                            leading: Icon(Icons.chat_outlined),
                            title: Text('Kesan: ${feedback?.kesan}'),
                            subtitle: Text('Saran: ${feedback?.saran}'),
                          ),
                        );
                      },
                    );
                  })),
        ],
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedbackForm()));
            }
            ;
            if (_currentIndex == 5) {
              _logout();
            };
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

  void addFeedback() {
    String feedbackText = feedbackController.text;
    if (feedbackText.isNotEmpty) {
      setState(() {
        feedbackList.add('+$feedbackText');
        feedbackController.clear();
      });
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
