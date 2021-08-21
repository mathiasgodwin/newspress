import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspress/src/features/newspress/views/screens/home_screen.dart';
import 'package:newspress/src/features/newspress/views/widgets/splashscreen_widget.dart';

import 'src/app.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(ProviderScope(child: NewsApp() ));
}

