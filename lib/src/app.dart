import 'package:flutter/material.dart';

import 'package:newspress/src/features/newspress/views/screens/home_screen.dart';

class NewsApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ηєωѕρяєѕѕ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: NewsHome(),
    );
  }
}