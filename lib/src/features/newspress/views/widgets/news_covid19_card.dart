import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget newsSearchCard(Color color, IconData icon, String title,
    BuildContext context, Widget route,double _w, dynamic _animation, dynamic _animation2) {
  // double _w = MediaQuery.of(context).size.width;

  return Opacity(
    opacity: _animation!.value,
    child: Transform.translate(
      offset: Offset(0, _animation2!.value),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          HapticFeedback.lightImpact();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return route;
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(15),
          height: _w / 1.3,
          width: _w / 2,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            boxShadow: [
              BoxShadow(
                  color: Color(0xff040039).withOpacity(.15), blurRadius: 99),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(),
              Container(
                height: _w / 8,
                width: _w / 8,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(
                  icon,
                  color: color.withOpacity(0.6),
                  size: 30,
                ),
              ),
              Text(
                title,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    ),
  );
}
