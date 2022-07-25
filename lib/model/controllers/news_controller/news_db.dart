// ignore_for_file: unused_import

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../model.dart';

part 'news_db.g.dart';

class NewsDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get author => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  TextColumn get publishedAt => text()();
  TextColumn get content => text()();
}

@DriftDatabase(tables: [NewsDB])
class NewsDatabase extends _$NewsDatabase {
  NewsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<NewsDBData>> get allNewsEntries => select(newsDB).get();

  void deleteNewsAll() async {
    final news = await allNewsEntries;
    news.forEach((e) {
      delete(newsDB).delete(e);
    });
  }

  void deleteNews(String title) async {
    final news = await allNewsEntries;
    news.forEach((e) {
      if (e.title == title) {
        delete(newsDB).delete(e);
      }
    });
  }

  Future<int> addNews(News news) {
    return into(newsDB).insert(
      NewsDBCompanion(
        author: Value(news.author),
        title: Value(news.title),
        description: Value(news.description),
        url: Value(news.url),
        urlToImage: Value(news.urlToImage),
        publishedAt: Value(news.publishedAt),
        content: Value(news.content),
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
