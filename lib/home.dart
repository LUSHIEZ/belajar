import 'package:belajar/halaman_utama.dart';
import 'package:belajar/profile.dart';
import 'package:belajar/saran.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:belajar/base_network.dart';
import 'package:belajar/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'convert_currency.dart';
import 'convert_time.dart';
import 'detail.dart';
import 'feedback.dart';
import 'login.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Buku? buku;
  List<ReadingLogEntries>? filteredBooks = [];

  bool isLoading = true;
  int _currentIndex = 0; // Added for bottom navigation bar


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await fetchDataFromApi();
      final parsedResponse = Buku.fromJson(json.decode(response.body));

      setState(() {
        buku = parsedResponse;
        filteredBooks = buku?.readingLogEntries ?? [];
        isLoading = false;
      });

      print(response.body);
    } catch (e) {
      print('Error: $e');
    }
  }

  void searchBooks(String query) {
    setState(() {
      filteredBooks = buku?.readingLogEntries
          ?.where((entry) =>
      entry.work?.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList() ??
          [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        foregroundColor: Colors.white,
        title: Center(
          child: Text('List Buku'),

        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              if (value == 'profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to RefreshPage.dart
                );
              } else if (value == 'logout') {
                _logout();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('profile'),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('logout'),
                ),
                // Add more menu items as needed
              ];
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                searchBooks(query);
              },
              decoration: InputDecoration(
                labelText: 'Cari Buku',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          if (isLoading) CircularProgressIndicator(),
          if (!isLoading && filteredBooks?.isEmpty == true)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tidak ada buku yang cocok.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: filteredBooks?.length ?? 0,
              itemBuilder: (context, index) {
                var list = filteredBooks?[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(readingLogEntry: list)));
                  },
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 7,
                              child: Image.network(
                                'https://covers.openlibrary.org/b/id/${list?.work?.coverId}-M.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                list?.work?.title ?? '',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
