import 'package:flutter/material.dart';

// import 'package:newspress/src/features/newspress/views/news_home_page.dart';
// import '../widgets/scroll_spy_card.dart';

class SwipePage extends StatelessWidget {
  dynamic nCard;
  SwipePage({
    Key? key,
    this.nCard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 15,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(0.4),
        title: Text(
          'ℕewspress',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(0.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: nCard,
    );
  }
}
