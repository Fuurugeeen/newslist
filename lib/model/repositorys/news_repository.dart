import 'package:newslist/model/services/base_service.dart';

import '../model.dart';
import '../services/news_service.dart';

class NewsRepository {
  final BaseService _newsService = NewsService();

  Future<List<News>> fetchNewsList(String value) async {
    final dynamic response = await _newsService.getResponse(value);
    final jsonData = response['articles'] as List<dynamic>;
    final newsList = jsonData
        .map((dynamic e) => News.fromJson(e as Map<String, dynamic>))
        .toList();
    return newsList;
  }
}
