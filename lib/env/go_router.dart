import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newslist/view/ini_page/ini_page.dart';
import 'package:newslist/view/news_top_page/news_top_page.dart';

import '../model/controllers/news_controller/news_db.dart';
import '../model/model.dart';
import '../view/news_info_page/news_info_page.dart';

const newsTopRote = '/';
const newsInfoRote = '/info';
const iniRote = '/ini';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        name: newsTopRote,
        path: newsTopRote,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const NewsTopPage(),
        ),
      ),
      GoRoute(
        name: newsInfoRote,
        path: newsInfoRote,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: NewsInfoPage(news: state.extra as NewsDBData),
        ),
      ),
      GoRoute(
        name: iniRote,
        path: iniRote,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: IniPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      child: Container(
        color: Colors.red,
      ),
    ),
  ),
);

class MyNavObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      debugPrint(
        'SHiPTEST didPush: ${route.str}, previousRoute= ${previousRoute?.str}',
      );

  @override
  // void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) => debugPrint(
  //     'SHiPTEST didPop: ${route.str}, previousRoute= ${previousRoute?.str}');
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    return debugPrint(
      'SHiPTEST didPop: ${route.str}, previousRoute= ${previousRoute?.str}',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      debugPrint(
        'SHiPTEST didRemove: ${route.str}, '
        'previousRoute= ${previousRoute?.str}',
      );

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      debugPrint(
        'SHiPTEST didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}',
      );

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      debugPrint(
        'SHiPTEST didStartUserGesture: ${route.str}, '
        'previousRoute= ${previousRoute?.str}',
      );

  @override
  void didStopUserGesture() => debugPrint('SHiPTEST didStopUserGesture');
}

extension on Route<dynamic> {
  String get str => 'route(${settings.name}: ${settings.arguments})';
}
