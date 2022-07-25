import 'package:flutter/foundation.dart';

import '../../app.dart';
import '../../model/model.dart';
import '../../widgets/widgets.dart';

class IniPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tt = Theme.of(context).textTheme;
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final currentThemeMode = ref.watch(themeSelectorProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'カラーテーマ設定',
            style: tt.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: ThemeMode.values.length,
          itemBuilder: (_, index) {
            final themeMode = ThemeMode.values[index];
            return RadioListTile<ThemeMode>(
              value: themeMode,
              groupValue: currentThemeMode,
              onChanged: (newTheme) => themeSelector.changeAndSave(newTheme!),
              title: Text(describeEnum(themeMode)),
            );
          },
        ),
      ),
    );
  }
}
