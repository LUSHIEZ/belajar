import 'package:belajar/convert_time.dart';
import 'package:belajar/profile.dart';
import 'package:belajar/saran.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feedback.dart';
import 'home.dart';
import 'login.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  int _currentIndex = 1;
  final List<Widget> _screens = [
    Home(),
    CurrencyConverter(),
    TimeConverter(),
    FeedbackForm(),
    ProfilePage(),
    // Add your Log Out screen here
  ];

  TextEditingController amountController = TextEditingController();
  String selectedFromCurrency = 'USD';
  String selectedToCurrency = 'EUR';
  String convertedResult = '';

  Map<String, double> conversionRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.73,
    'JPY': 110.13,
    'CAD': 1.25,
    'AUD': 1.34,
    'IDR': 14247.50,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        title: Text('Currency Converter'),
        backgroundColor: Colors.brown[500],
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  labelStyle: TextStyle(
                      color: Colors.white
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  )
              ),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCurrencyDropdown(selectedFromCurrency, true),
                Text('to', style: TextStyle(color: Colors.white)),
                buildCurrencyDropdown(selectedToCurrency, false),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.brown[500]!)
              ),
              onPressed: () {
                convertCurrency();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text('Converted Result: $convertedResult', style: TextStyle(color: Colors.white)),
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




          // Add more BottomNavigationBarItems for additional screens
        ],
      ),
    );
  }

  Widget buildCurrencyDropdown(String selectedValue, bool isFrom) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          if (isFrom) {
            selectedFromCurrency = newValue!;
          } else {
            selectedToCurrency = newValue!;
          }
        });
      },
      icon: Icon(Icons.arrow_drop_down, color: Colors.white), // Set the color to white
      items: conversionRates.keys
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void convertCurrency() {
    final double amount = double.tryParse(amountController.text) ?? 0.0;

    final double fromRate = conversionRates[selectedFromCurrency] ?? 1.0;
    final double toRate = conversionRates[selectedToCurrency] ?? 1.0;

    final double result = amount * (toRate / fromRate);

    setState(() {
      convertedResult = result.toStringAsFixed(2);
    });
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