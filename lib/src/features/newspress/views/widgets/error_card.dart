

import 'package:flutter/material.dart';

Widget errorCard(w, message){
  double _w = w;
  return Container(
            padding: EdgeInsets.all(15),
            height: _w / 2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xff040039).withOpacity(.15), blurRadius: 99),
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(),
                Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.orangeAccent.withOpacity(0.6),
                    size: 70,
                  ),

                  Text(
                        message,
                        maxLines: 10,
                        // softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                // ),
                
                // SizedBox(),
              ],
            ),
          );
}