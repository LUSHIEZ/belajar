import 'package:belajar/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'feedback_model.dart';

void main() async {
  await Hive.initFlutter();

  // Register the Hive adapters here
  Hive.registerAdapter(FeedbackModelAdapter());
  await Hive.openBox<FeedbackModel>('feedback');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
