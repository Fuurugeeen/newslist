import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newslist/model/model.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  factory NewsState({
    @Default('') String status,
    @Default(0) int totalResults,
    @Default(<News>[]) List<News> articles,
    @Default('') String searchStr,
  }) = _NewsState;

  NewsState._();
}
