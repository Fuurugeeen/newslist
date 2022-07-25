import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newslist/model/controllers/news_controller/news_db.dart';

import '../../../env/env.dart';
import '../../../model/model.dart';

class NewsList extends ConsumerWidget {
  const NewsList({
    required this.news,
  });

  final List<NewsDBData> news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tt = Theme.of(context).textTheme;

    // 記事タイトルのみ絞り込み
    final newsSerchStr = ref.watch(newsProvider).searchStr;
    final items = news.where((e) => e.title.contains(newsSerchStr)).toList();

    // 記事の更新日付の降順にソート
    items.sort((a, b) => -a.publishedAt.compareTo(b.publishedAt));

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Card(
            child: InkWell(
              onTap: () {
                // 記事詳細(WebView)へ遷移
                context.pushNamed(newsInfoRote, extra: item);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: item.urlToImage,
                      width: 100,
                      errorWidget:
                          (BuildContext context, String url, dynamic error) =>
                              Icon(Icons.error),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // タイトル
                          AutoSizeText(
                            item.title,
                            maxLines: 3,
                            minFontSize: tt.displayLarge!.fontSize!,
                            softWrap: true,
                            style: tt.displayLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              wordSpacing: 3,
                            ),
                          ),
                          // 時間
                          AutoSizeText(
                            item.publishedAt,
                            softWrap: true,
                            style: tt.displaySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          // 説明文
                          AutoSizeText(
                            item.description,
                            minFontSize: tt.displayLarge!.fontSize!,
                            softWrap: true,
                            style: tt.displayLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
