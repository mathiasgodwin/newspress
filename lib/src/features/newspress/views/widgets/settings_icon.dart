

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newspress/src/features/newspress/views/screens/swipe_page.dart';

Widget settingsIcon(
  BuildContext context, double _w
) {
  
  // double _w = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap:null 
          // () {
          //   HapticFeedback.lightImpact();
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) {
          //         return ;
          //       },
          //     ),
          //   );
          // },
          ,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(99),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: _w / 8.5,
                width: _w / 8.5,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.settings,
                    size: _w / 17,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
