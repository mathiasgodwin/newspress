// splash screen Widget
/// Credit: Gaurav Tantuway

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  AnimationController? _controller;
  Animation<double>? animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller!, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller!.forward();

    Timer(Duration(seconds: 1), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 1), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    // Timer(Duration(seconds: 4), () {
    //   setState(() {
    //     Navigator.maybePop(context);
    //   });
    // });
  }

  @override
  void dispose() {
    _controller?.stop();
    _controller!.dispose();
    super.dispose();
  }

  Widget textAnime() {
    const colorizeColors = [
      Colors.greenAccent,
      Colors.yellow,
      Colors.blue,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
    );

    return SizedBox(
      width: 250.0,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText('Newspress',
              speed: Duration(milliseconds: 120),
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
              textAlign: TextAlign.end),
          ColorizeAnimatedText('News from the right source',
              textStyle: TextStyle(fontSize: 20),
              colors: colorizeColors,
              speed: Duration(milliseconds: 250),
              textAlign: TextAlign.end),
        ],
        totalRepeatCount: 1,
        repeatForever: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / (_fontSize * 1.1)),
              AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: _textOpacity,
                  child: textAnime()),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _width / _containerSize,
                  width: _width / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/icon/newspress_icon.png')),
            ),
          ),
        ],
      ),
    );
  }
}
