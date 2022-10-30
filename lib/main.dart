import 'package:flutter/material.dart';
import 'package:youtube_studio_clone/bottom_nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const YoutubeStudioBNB(),
    );
  }
}
