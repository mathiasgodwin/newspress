import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspress/src/features/newspress/logic/newspress_provider.dart';

import 'widgets/news_card.dart';

// import '';

const _space = SizedBox(height: 50,);
/// * Keys for testing
final getHeadlineKey = UniqueKey();
final searchKey      = UniqueKey();

class NewsPage extends StatelessWidget{

  @override 
  Widget build(BuildContext context ){
    return Scaffold(  
      // appBar: AppBar(title: Text('NewsPress'),),
      body: Center(  
        child: Column (  
          children: [
            const Spacer(),
            const NewsCard(),
            _space,
            const _GetHButton(),

          ],
        ),
      ),
    );

  }
}

// class NewsHConsumer extends ConsumerWidget {
//   const NewsHConsumer({Key? key}) : super(key: key);

//   @override 
//   Widget build(BuildContext context, ScopedReader watch) {

//      final state  = watch(newspressNotifierProvider);
     
//      return state.when(
//        initial: () => Text('Now Loading'),
//        data: (news) => NewsCard(news: news),
//        loading: () => CircularProgressIndicator(),
//        error: (e) => _Message('Error'),
//      );
//     }
// }

//class _Message extends StatelessWidget {
//
//   final String message = 'Nothing serious';
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(20),
     // child: Text(
    //    message,
   //     style: Theme.of(context).textTheme.headline5,
   //     textAlign: TextAlign.center,
  //    ),
 //   );
 // }
//}

/// Get headline button consumer
class _GetHButton extends ConsumerWidget {
  const _GetHButton();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(newspressNotifierProvider);

    

    return CupertinoButton.filled(
      key: getHeadlineKey,
      child: Text('Headline'),
      onPressed: !state.isLoading
          ? () {
              context.read(newspressNotifierProvider.notifier).getSearch('muhammed buhari');
            }
          : null,
    );
  }
}
