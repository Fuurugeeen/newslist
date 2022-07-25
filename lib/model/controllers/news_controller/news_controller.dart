import 'dart:async';

import 'package:newslist/model/controllers/news_controller/news_db.dart';
import 'package:newslist/model/model.dart';

import '../../../env/env.dart';
import '../../repositorys/repositorys.dart';

export 'news_state.dart';

final _newsDB = NewsDatabase();

final newsListProvider = FutureProvider<List<NewsDBData>>((ref) async {
  final news = ref.read(newsProvider.notifier);

  // 記事問合せ、ローカルDBに保存
  await news.fetchNewsData();

  // ローカルDBから記事一覧取得
  final items = await news.getNews();

  // 記事の更新日付の降順にソート
  items.sort((a, b) => -a.publishedAt.compareTo(b.publishedAt));

  return items;
});

final newsProvider = StateNotifierProvider<NewsController, NewsState>((ref) {
  return NewsController(ref.read);
});

class NewsController extends StateNotifier<NewsState> {
  NewsController(this._read) : super(NewsState());

  // ローカルDBのすべての記事取得
  Future<List<NewsDBData>> getNews() async {
    final news = await _newsDB.allNewsEntries;
    return news;
  }

  // ローカルDBのすべての記事削除
  void deleteNewsAll() {
    _newsDB.deleteNewsAll();
  }

  // ローカルDBのすべての記事削除
  void deleteNews(String title) {
    _newsDB.deleteNews(title);
  }

  Future<void> deleteOldNews() async {
    // ローカルDBの記事一覧を取得
    final dbNews = await getNews();

    // 現在日付取得
    final now = DateTime.now();
    //final now = DateTime.parse('2022-07-22'); // 削除確認用

    for (final e in dbNews) {
      // 記事の日付を取得 publishedAt
      // 3日以上前の記事なら削除
      // publishedAt → 2022-07-23T12:31:10Z
      final publishedAt = e.publishedAt.substring(0, 10);
      final dateTime = DateTime.parse(publishedAt);
      final inDays = dateTime.difference(now).inDays;

      if (inDays >= 3) {
        // 1日以上前の記事は削除
        deleteNews(e.title);
      }

      print(e);
    }
  }

  // 記事問合せ、ローカルDB追加
  Future<void> fetchNewsData() async {
    List<News> newsList = [];
    try {
      newsList = await NewsRepository().fetchNewsList(
          '/top-headlines?country=jp&apiKey=' + Strings.newApiKey);
      state = state.copyWith(articles: newsList);
    } catch (e) {
      // print(e);
    }

    if (newsList.length == 0) {
      // 取得した記事が0件なら抜ける
      return;
    }

    // ローカルDBの記事一覧を取得
    final dbNews = await getNews();
    // API取得した記事と比較し、記事がない場合は追加
    for (final addNews in newsList) {
      final index = dbNews.indexWhere((db) => db.title == addNews.title);
      print(index);
      if (index == -1) {
        _newsDB.addNews(addNews);
      }
    }

    // ローカルDBなので古い記事は削除
    await deleteOldNews();
  }

  // 記事絞り込み
  void setSerchStr(String value) {
    // 検索用文字列をセット
    state = state.copyWith(searchStr: value);
  }

  // 他クラス参照用
  //   late final _prefs = _read(xxxProvider);
  final Reader _read;
}
