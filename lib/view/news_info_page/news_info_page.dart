import 'dart:async';
import 'dart:io';

import 'package:newslist/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../model/controllers/news_controller/news_db.dart';

class NewsInfoPage extends StatefulWidget {
  NewsInfoPage({required this.news, Key? key}) : super(key: key);
  final NewsDBData? news;

  @override
  State<NewsInfoPage> createState() => _NewsInfoPageState();
}

class _NewsInfoPageState extends State<NewsInfoPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    // newsがnullの場合は未考慮。
    final news = widget.news!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title,
          style: tt.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            // ニュース記事のURL指定
            initialUrl: news.url,
            // JavaScript有効
            javascriptMode: JavascriptMode.unrestricted,
            // ページ生成後に呼ばれるイベント
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              // 読込進捗
              print('WebView is loading (progress : $progress%)');
            },
            javascriptChannels: <JavascriptChannel>{
              // ブラウザ側(JavaScript)からの通知受取
              _toasterJavascriptChannel(context),
            },
            navigationDelegate: (NavigationRequest request) {
              // 表示したくないページはここでブロック可
              // // 表示した記事以外への遷移不可 等。
              // if (request.url != news.url) {
              //   return NavigationDecision.prevent;
              // }

              // print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              // print('Page started loading: $url');
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (String url) {
              // print('Page finished loading: $url');
              setState(() {
                isLoading = false;
              });
            },
            gestureNavigationEnabled: true,
            backgroundColor: const Color(0x00000000),
          ),
          // onProgressが100％になるまでインゲージ表示
          // WebView操作自体は途中から可能なので完了間近からインゲージが残って見える
          isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox.shrink()
        ],
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
