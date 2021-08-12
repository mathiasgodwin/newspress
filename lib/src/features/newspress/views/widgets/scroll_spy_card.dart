import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:newspress/src/features/newspress/logic/newspress_provider.dart';
import 'package:newspress/src/features/newspress/views/screens/swipe_page.dart';
import 'package:newspress/src/features/newspress/views/widgets/error_card.dart';
import 'package:newspress/src/features/newspress/views/widgets/loading_widget.dart';

import 'cards.dart' show LCard, LCardBody, LCardFooter, LCardHeader, LCardImage;

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
      return LCard(
        border: Border.all(color: Colors.greenAccent.withOpacity(.5)),
        elevation: 5.0,
        header: LCardHeader(title: news.title ?? ''),
        // footer: LCardFooter(
        //   // showSeperator: true,
        //   actions: <Widget>[

        //         IconButton(
        //           icon: Image.asset(
        //             'assets/images/twitter_logo.png',
        //             width: 20,
        //             height: 20,
        //           ),
        //           iconSize: 15,
        //           color: Colors.blue,
        //           onPressed: () {
        //             print(news.twitterAccount);
        //           },
        //         ),
              
            
        //   ],
        // ),
        image: LCardImage(
          image: news.media == null
              ? NetworkImage(
                  'http://www.newdesignfile.com/postpic/2015/02/funny-no-image-available-icon_68017.jpg')
              : NetworkImage(news.media),
          fit: BoxFit.fitWidth,
        ),
        body: LCardBody(
          // titleMargin: EdgeInsets.zero,
          title: news.publishedDate.toString().substring(0, 16),
          subTitle: news.summary,
        ),
      );
    }

    dynamic providerCard({id, index}) {
      return state.when(
          loading: () => id == 1 ? 1 : LoadingWidget(),
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
              id == 1 ? 1 : errorCard(_w, 'No internet connection'));
    }

    // ignore: non_constant_identifier_names
    return SwipePage(
      nCard: SmartRefresher(
        // scrollController: ScrollDragController,
        enablePullDown: true,
        // enablePullUp: true,
        header: WaterDropHeader(
          waterDropColor: Colors.greenAccent.withOpacity(.5),
          refresh: Text('Refreshing...'),
        ),
        // footer: CustomFooter(
        //   builder: (BuildContext context, LoadStatus? mode) {
        //     Widget body;
        //     if (mode == LoadStatus.idle) {
        //       body = Text("pull up load");
        //     } else if (mode == LoadStatus.loading) {
        //       body = Text('Loading');
        //     } else if (mode == LoadStatus.failed) {
        //       body = Text("Load Failed! Click retry!");
        //     } else if (mode == LoadStatus.canLoading) {
        //       body = Text("release to load more");
        //     } else {
        //       body = Text("No more Data");
        //     }
        //     return body;
        //   },
        // ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        // onLoading: _onLoading(providerCard(id: 2)),
        child: ListView.builder(
          itemBuilder: (c, i) => providerCard(index: i, id: 0),
          itemExtent: 600.0,
          itemCount: providerCard(id: 1),
        ),
      ),
    );
  }
}
