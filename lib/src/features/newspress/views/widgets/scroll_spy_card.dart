import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:newspress/src/features/newspress/views/widgets/inapp_webview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:newspress/src/features/newspress/logic/newspress_provider.dart';
import 'package:newspress/src/features/newspress/views/screens/swipe_page.dart';
import 'package:newspress/src/features/newspress/views/widgets/error_card.dart';

class NewsCard extends ConsumerWidget {
  final int? categoryNum;
  const NewsCard(
    this.categoryNum, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _w = MediaQuery.of(context).size.width;
    final state = watch(newspressNotifierProvider);

    RefreshController _refreshController =
        RefreshController(initialRefresh: true);

    dynamic _onRefresh() async {
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      _refreshController.refreshCompleted();

      /// Business news category
      if (this.categoryNum == 1) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('business')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }

      /// Science news category
      else if (this.categoryNum == 2) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('science')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }

      /// General news category
      else if (this.categoryNum == 3) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('breaking news')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }

      /// Health news category
      else if (this.categoryNum == 4) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('health')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }

      /// Entertainment news category
      else if (this.categoryNum == 5) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('entertainment')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }

      ///  Technology news category
      else if (this.categoryNum == 6) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('technology')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }

      /// Sport news category
      else if (this.categoryNum == 7) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('sport')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }

      /// News search
      else if (this.categoryNum == 8) {
        await context
            .read(newspressNotifierProvider.notifier)
            .getSearch('covid19')
            .onError((error, stackTrace) => _refreshController.refreshFailed());
      }
    }

    // dynamic _onLoading(Map<String?, int?> pages) async {
    //   int? tPage = pages['total_page'];
    //   int? cPage = pages['current_page'];
    //   if (cPage! < tPage!) {
    //     int nextPage = cPage + 1;

    //     await context
    //         .read(newspressNotifierProvider.notifier)
    //         .getSearch('bitcoin&$nextPage');
    // _refreshController.
    // .then((value) => _refreshController.loadComplete())
    // .whenComplete(() => _refreshController.loadComplete());
    // .catchError((error, stackTrace) => _refreshController.loadFailed()
    // );

    // }
    // }

    Widget infoCard(news) {
      var card = GFCard(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        boxFit: BoxFit.fitWidth,
        titlePosition: GFPosition.start,
        showImage: true,
        image: news.media == null
            ? Image.asset('assets/images/not_available.jpg')
            : Image.network(news.media),
        title: news.title == null
            ? null
            : GFListTile(
                avatar: IconButton(
                  icon: Image.asset(
                    'assets/images/twitter_logo.png',
                    width: 20,
                    height: 20,
                  ),
                  iconSize: 15,
                  color: Colors.blue,
                  onPressed: null,

                  //() {
                  // HapticFeedback.lightImpact();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return news.twitterAccount == null ? null : WebViewer(
                  //     selectedUrl: news.link,
                  //     title: 'Newspress',
                  //     );
                  //   }));
                  // }
                ),
                title: Text(news.title),
              ),
        content: GFAccordion(
          showAccordion: false,
          textStyle: TextStyle(
            fontSize: 13,
          ),
          title: '...',
          // title: 'Publisher: ' + news.twitterAccount == null ? 'Unknown' : news.twitterAccount +  ':      Read more...',
          // title: news.summary == null
          //     ? ''
          //     : news.summary.toString().substring(0, 20) + '...',
          content: news.summary,
          // content: news.summary == null
          //     ? null
          //     : news.summary.toString().length > 175
          //         ? news.summary.toString().substring(0, 175) + '...'
          //         : news.summary,
          // contentChild: Row(
          //   children: <Widget>[
          //     IconButton(
          //       icon: Image.asset(
          //         'assets/images/twitter_logo.png',
          //         width: 20,
          //         height: 20,
          //       ),
          //       iconSize: 15,
          //       color: Colors.blue,
          //       onPressed: () {
          //         print(news.twitterAccount);
          //       },
          //     ),
          //   ],
          // ),
        ),
        buttonBar: GFButtonBar(
          children: [
            GFButtonBadge(
              color: Colors.blueAccent,
              type: GFButtonType.outline2x,
              text: 'Read more',
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WebViewer(
                        selectedUrl: news.link,
                        title: 'Newspress',
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      );

      return card;
    }

    dynamic providerCard({id, index}) {
      return state.when(
          loading: () => id == 1
              ? 1
              : Center(
                  child: Container(
                    width: _w / 2.5,
                    height: _w / 2,
                    child: GFLoader(
                      type: GFLoaderType.circle,
                      size: GFSize.LARGE,
                    ),
                  ),
                ),
          data: (newsList) {
            if (id == 1) {
              return newsList.pageSize;
            } else if (id == 0) {
              return infoCard(newsList.articles[index]);
            } else if (newsList.articles.isEmpty) {
              return errorCard(_w, 'Oops! There was an internal error.');
            } else if (id == 2) {
              // TO-DO: ##########
              Map<String?, int?> t = {
                'total_page': newsList.totalPages,
                'current_page': newsList.page
              };
              return t;
            }
          },
          error: (error) =>
              id == 1 ? 1 : errorCard(_w, 'No internet connection')

          // GFToast(
          //   text: 'Make sure you\'re connected',
          //   button: GFButton(
          //     onPressed: _onRefresh(),
          //     text: 'Retry',
          //   ),
          // );
          );
    }

    // ignore: non_constant_identifier_names
    return SwipePage(
      nCard: SmartRefresher(
        scrollDirection: Axis.vertical,
        enablePullDown: true,
        header: WaterDropHeader(
          waterDropColor: Colors.greenAccent.withOpacity(.5),
          refresh: Text('Refreshing...'),
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        // onLoading: _onLoading(providerCard(id: 2)),
        child: ListView.builder(
          // scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          itemBuilder: (c, i) => providerCard(index: i, id: 0),
          // itemExtent: 700.0,
          itemCount: providerCard(id: 1),
        ),
      ),
    );
  }
}
