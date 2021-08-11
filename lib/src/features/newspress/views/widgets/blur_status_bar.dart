import 'package:flutter/material.dart';
import 'dart:ui';

Widget blurStatusBar(BuildContext context, double _w) {
  // double _w = MediaQuery.of(context).size.width;
  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(height: _w / 18, color: Colors.transparent),
    ),
  );
}
