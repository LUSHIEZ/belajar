import 'package:belajar/halaman_utama.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  String password = "";
  late SharedPreferences sharedPreferences;
  late bool newUser;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    newUser = (sharedPreferences.getBool('login') ?? true); // Add "?"
    print(newUser);
    if (newUser == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Books App'),

        backgroundColor: Colors.brown[500],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.ipindo.com/images/stories/cipta/hak-cipta-buku.jpg',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input username',
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),

                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                ),
                child: Text('Login'),

                onPressed: () async {
                  sharedPreferences.setBool('login', false);
                  sharedPreferences.setString('username', username);
                  String message = "";
                  username = usernameController.text;
                  password = passwordController.text.trim();
                  if (username == "mobile" && password == "mobile") {
                    Navigator.push(
                        context, MaterialPageRoute(builder: ((context) => Home())));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Login berhasil.'),
                                backgroundColor: Colors.green,
                            )
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login gagal.'),
                          backgroundColor: Colors.red,
                        )
                    );
                  }
                },
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text('Belum punya akun? daftar disini'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
