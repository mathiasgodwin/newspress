import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:newspress/src/features/newspress/views/widgets/blur_status_bar.dart';
import 'package:newspress/src/features/newspress/views/widgets/news_category_card.dart';
import 'package:newspress/src/features/newspress/views/widgets/news_search_card.dart';
import 'package:newspress/src/features/newspress/views/widgets/settings_icon.dart';

import 'swipe_page.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeUIState createState() => _NewsHomeUIState();
}

class _NewsHomeUIState extends State<NewsHome>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  Animation<double>? _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {});
          });
    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));
    _controller!.forward();
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Get device width for responsive widget rendering
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ℕ𝕖𝕨𝕤𝕡𝕣𝕖𝕤𝕤',
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.black.withOpacity(.6),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: _w / 35),
                    Text(
                      'News from the right source!',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                    // Divider(
                    //   color: Colors.greenAccent,
                    //   indent: _w / 420,
                    //   endIndent: _w / 280,
                    //   thickness: 3,
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: _w / 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    newsCardAtom(
                        Color(0xfff37736),
                        Icons.business_center_rounded,
                        'Business',
                        context,
                        SwipePage(),
                        _w,
                        _animation,
                        _animation2),
                    newsCardAtom(
                      Color(0xfff37736),
                      Icons.science,
                      'Science',
                      context,
                      SwipePage(),
                      _w,
                      _animation,
                      _animation2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    newsCardAtom(
                        Color(0xfff37736),
                        Icons.chevron_right_outlined,
                        'General',
                        context,
                        SwipePage(),
                        _w,
                        _animation,
                        _animation2),
                    newsCardAtom(
                        Color(0xfff37736),
                        Icons.free_breakfast_outlined,
                        'Health',
                        context,
                        SwipePage(),
                        _w,
                        _animation,
                        _animation2),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    newsCardAtom(
                        Color(0xfff37736),
                        Icons.theaters_sharp,
                        'Entertainment',
                        context,
                        SwipePage(),
                        _w,
                        _animation,
                        _animation2),
                    newsCardAtom(
                      Color(0xfff37736),
                      Icons.car_repair,
                      'Technology',
                      context,
                      SwipePage(),
                      _w,
                      _animation,
                      _animation2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    newsCardAtom(
                        Color(0xfff37736),
                        Icons.sports_football_rounded,
                        'Sports',
                        context,
                        SwipePage(),
                        _w,
                        _animation,
                        _animation2),
                    newsSearchCard(
                        Colors.purple,
                        Icons.search_rounded,
                        'News Search',
                        context,
                        SwipePage(),
                        _w,
                        _animation,
                        _animation2),
                  ],
                ),
              ),
            ],
          ),

          /// SETTING ICON
          settingsIcon(context, _w),

          /// Blur status bar
          blurStatusBar(context, _w),
        ],
      ),
    );
  }
}
