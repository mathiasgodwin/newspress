import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspress/src/features/newspress/views/screens/swipe_page.dart';
import 'package:newspress/src/features/newspress/views/widgets/error_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'cards.dart' show LCard, LCardBody, LCardFooter, LCardHeader, LCardImage;
import 'package:newspress/src/features/newspress/logic/newspress_provider.dart';

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
        border: Border.all(color: Colors.pink),
        elevation: 5.0,
        header: LCardHeader(title: news.title),
        footer: LCardFooter(
          actions: <Widget>[
            Row(
              children: [
                Icon(Icons.person_pin_circle_rounded),
                Text(': '),
                IconButton(
                  icon: Text(news.twitterAccount),
                  iconSize: 15,
                  color: Colors.blue,
                  onPressed: () {
                    print(news.twitterAccount);
                  },
                ),
              ],
            ),
          ],
        ),
        image: LCardImage(
          image: NetworkImage(news.media),
          fit: BoxFit.cover,
        ),
        body: LCardBody(
          title: news.publishedDate.toString().substring(0, 16),
          subTitle: news.summary,
        ),
      );
    }

    dynamic providerCard({id, index}) {
      return state.when(
          loading: () => id == 1
              ? 1
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlue,
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
              // TO-DO
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
        enablePullDown: true,
        // enablePullUp: true,
        header: WaterDropHeader(),
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
