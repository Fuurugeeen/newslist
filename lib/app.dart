// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:newslist/env/app_theme_dark_data.dart';
import 'package:newslist/env/app_theme_light_data.dart';

import 'env/env.dart';
import 'model/model.dart';

final themeSelectorProvider = StateNotifierProvider<ThemeSelector, ThemeMode>(
  (ref) => ThemeSelector(ref.read),
);

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myRouter = ref.watch(routerProvider);

    return MaterialApp.router(
        routeInformationParser: myRouter.routeInformationParser,
        routerDelegate: myRouter.routerDelegate,
        theme: myLightThemeData,
        darkTheme: myDackThemeData,
        themeMode: ref.watch(themeSelectorProvider), // 現在のテーマモード設定を監視
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Stack(
            children: [
              if (child != null) child,
              // Consumer(builder: (context, ref, child) {
              //   // 画面全体を覆うインゲージ表示用
              //   // final isDisplaying = ref.watch(xxxsProvider).isDisplaying;
              //   // if (isDisplaying) {
              //   //   return const ColoredBox(
              //   //     color: Colors.black54,
              //   //     child: Center(
              //   //       child: CircularProgressIndicator(),
              //   //     ),
              //   //   );
              //   // }
              //   // return const SizedBox.shrink();
              // }),
            ],
          );
        });
  }
}

class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector(this._read) : super(ThemeMode.system) {
    /// `SharedPreferences` を使用して、記憶しているテーマがあれば取得して反映する。
    final themeIndex = _prefs.getInt(Strings.keyThemePrefsKey);
    if (themeIndex == null) {
      // なければライトを初期値にする
      state = ThemeMode.light;
      return;
    }
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
    state = themeMode;
  }

  // テーマの変更と保存を行う
  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(Strings.keyThemePrefsKey, theme.index);
    state = theme;
  }

  final Reader _read;

  // 選択したテーマを保存するためのローカル保存領域
  late final _prefs = _read(sharedPreferencesProvider);
}
