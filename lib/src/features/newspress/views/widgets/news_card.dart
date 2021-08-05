import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspackage/newspress.dart';
import 'package:newspackage/src/data/models/article_response.dart';

import 'package:newspress/src/features/newspress/logic/newspress_provider.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({
    Key? key,
    // required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final theme = Theme.of(context);

    final state = watch(newspressNotifierProvider);

    return state.when(
        initial: () => Text('Hi'),
        loading: () => Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlue,
              ),
            ),
        data: (news) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(news[0].summary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        error: (error) =>  Text(error.toString())
        );
  }
}
