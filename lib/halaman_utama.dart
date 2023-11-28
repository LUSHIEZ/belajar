import 'package:belajar/home.dart';
import 'package:belajar/profile.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Card(
                color: Colors.brown[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://media.istockphoto.com/id/157482029/id/foto/tumpukan-buku.jpg?s=612x612&w=0&k=20&c=O_9EUqpOuTEyKuI05yLG2x_pmzX8mQ9U0fFO2ZC-jKg='),
                            radius: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 3.0, bottom: 3.0, right: 15.0),
                        child: Text(
                          'List Buku',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0,top: 3.0, bottom: 3.0,right: 15.0),
                        child: Text(
                          'Menampilkan sejumlah buku dan informasi detail dari buku tersebut',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Card(
                color: Colors.brown[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-NYrQbWf7mbYXRWAi9jMiXzwpiaEk4EIsug&usqp=CAU'),
                            radius: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 3.0, bottom: 3.0, right: 15.0),
                        child: Text(
                          'Konversi Mata Uang',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0,top: 3.0, bottom: 3.0,right: 15.0),
                        child: Text(
                          'Menampilkan fungsi untuk mengkonversikan nilai mata uang ke mata uang lainnya',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Card(
                color: Colors.brown[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://imgix3.ruangguru.com/assets/miscellaneous/png_ip1j2a_4010.png'),
                            radius: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 3.0, bottom: 3.0, right: 15.0),
                        child: Text(
                          'Konversi Waktu',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0,top: 3.0, bottom: 3.0,right: 15.0),
                        child: Text(
                          'Mengubah waktu berdasarkan pembagian waktu yang sudah ditetapkan (WIB, WITA, WIT)  ',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Card(
                color: Colors.brown[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://imgix3.ruangguru.com/assets/miscellaneous/png_ip1j2a_4010.png'),
                            radius: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 3.0, bottom: 3.0, right: 15.0),
                        child: Text(
                          'Konversi Waktu',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0,top: 3.0, bottom: 3.0,right: 15.0),
                        child: Text(
                          'Mengubah waktu berdasarkan pembagian waktu yang sudah ditetapkan (WIB, WITA, WIT)  ',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10)

          ],
        ),
      ),
    );
  }
}
