import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:liquid_ui/liquid_ui.dart';

Widget scrollCard(news) {
  return LCard(
    border: Border.all(color: Colors.pink),
    elevation: 5.0,
    header: LCardHeader(title: news.title),
    footer: LCardFooter(
      actions: <Widget>[
        Row(
          children: [
            Icon(Icons.send),
            Text(': ' + news.twitter_account),
          ],
        ),
      ],
    ),
    image: LCardImage(
      image: NetworkImage(news.media),
      fit: BoxFit.cover,
    ),
    body: LCardBody(
      title: news.published_date,
      subTitle: news.summary,
    ),
  );
}
