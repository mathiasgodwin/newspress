/// Credit: https://github.com/techwithsam

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class WebViewer extends StatefulWidget {

  final String title;
  final String selectedUrl;
  WebViewer({
    Key? key,
    required this.title,
    required this.selectedUrl,
  }) : super(key: key);

  @override
  _WebViewState createState() =>
      _WebViewState(title: title, selectedUrl: selectedUrl);
}

class _WebViewState extends State<WebViewer> {
  final String title;
  final String? selectedUrl;
  _WebViewState({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.8),
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
           brightness: Brightness.light,
          elevation: 15,
          shadowColor: Colors.black.withOpacity(0.4),
          title: Text('$title'),
          centerTitle: true,
        ),
        url: selectedUrl!,
        withZoom: false,
        withLocalStorage: true,
        hidden: false,
        initialChild: Container(
          child: Center(
            child: GFLoader(type: GFLoaderType.circle,),
          ),
        ),
      ),
    );
  }
}