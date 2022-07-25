// ignore: directives_ordering, unused_import
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  factory News({
    @Default(<String, dynamic>{}) Map<String, dynamic> source,
    @Default('') String author,
    @Default('') String title,
    @Default('') String description,
    @Default('') String url,
    @Default('') String urlToImage,
    @Default('') String publishedAt,
    @Default('') String content,
  }) = _News;
  News._();

  factory News.fromJson(Map<String, dynamic> json) => _$_News.fromJson(json);
}
