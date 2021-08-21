import 'package:flutter/material.dart';

import 'package:newspress/src/features/newspress/views/screens/home_screen.dart';
import 'package:newspress/src/features/newspress/views/widgets/splashscreen_widget.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false, home: SplashScreen());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light()
                .copyWith(visualDensity: VisualDensity.adaptivePlatformDensity),
            home: NewsHome(),
          );
        }
      },
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(Duration(seconds: 5));
    // This is a bad practice, I'm only learning
    // I had to add this line, Just to test alot of things out :)
  }
}
