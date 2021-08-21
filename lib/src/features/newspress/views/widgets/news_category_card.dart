import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspress/src/features/newspress/logic/newspress_provider.dart';

class NewsCardAtom extends ConsumerWidget {
  final Color color;
  final IconData icon;
  final String title;
  final Widget route;
  final double w;
  final dynamic animation;
  final dynamic animation2;

  NewsCardAtom(this.color, this.icon, this.title, this.route, this.w,
      this.animation, this.animation2);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final state = watch(newspressNotifierProvider);
    return Opacity(
      opacity: this.animation!.value,
      child: Transform.translate(
        offset: Offset(0, this.animation2!.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            // !state.isLoading
            //     // ignore: unnecessary_statements
            //     ? () {
            //         context
            //             .read(newspressNotifierProvider.notifier)
            //             .getSearch('Christian Ronaldo');
            //       }
            //     // ignore: unnecessary_statements
            // //     : null;
            // context
            //     .read(newspressNotifierProvider.notifier)
            //     .getSearch('Christian Ronaldo');
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
            height: this.w / 2,
            width: this.w / 2.4,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orangeAccent.withOpacity(.3),
                style: BorderStyle.solid,
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.greenAccent.withOpacity(.12), blurRadius: 99, spreadRadius: .12),
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
                  height: this.w / 8,
                  width: this.w / 8,
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.1), shape: BoxShape.circle),
                  child: Icon(
                    icon,
                    color: color.withOpacity(0.6),
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
}

