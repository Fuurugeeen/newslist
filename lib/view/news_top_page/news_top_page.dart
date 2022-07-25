import 'package:flutter/services.dart';
import 'package:newslist/model/model.dart';
import 'package:newslist/widgets/widgets.dart';

import 'widgets/bottomBar.dart';
import 'widgets/news_list.dart';

class NewsTopPage extends ConsumerWidget {
  const NewsTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tt = Theme.of(context).textTheme;

    // 記事問合せ状態を保持、初回または問い合わせと中はインゲージ表示
    final asyncValue = ref.watch(newsListProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                enabled: true,
                // 最大文字数
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                style: tt.displayLarge,
                obscureText: false,
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  hintText: '検索ワードを入れてください',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  // 検索ワード入力
                  ref.read(newsProvider.notifier).setSerchStr(value);
                },
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  // 記事再取得
                  ref.refresh(newsListProvider);
                },
                child: asyncValue.when(
                  data: (data) {
                    // 記事一覧表示
                    return NewsList(news: data);
                  },
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, _) => Text(
                    error.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            // 記事再取得
            ref.refresh(newsListProvider);
          },
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
