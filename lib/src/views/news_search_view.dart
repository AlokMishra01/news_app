import 'package:flutter/material.dart';
import 'package:news_app/api/get_news.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/src/widget/news_search_app_bar.dart';

import 'news_list_body.dart';

class NewsSearchView extends StatefulWidget {
  const NewsSearchView({Key? key}) : super(key: key);

  static const newsSearchViewRoute = '/newsSearch';

  @override
  State<NewsSearchView> createState() => _NewsSearchViewState();
}

class _NewsSearchViewState extends State<NewsSearchView> {
  NewsResponseModel? newsData;
  String _query = '';
  bool _isLoading = false;
  bool _loadingMore = false;
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNewsSearchAppBar(
          context: context,
          isLoading: _isLoading,
          onChanged: (value) {
            _query = value;
          },
          onSearch: () {
            FocusScope.of(context).unfocus();
            if (!_isLoading) {
              _page = 1;
              _loadNews(query: _query);
            }
          }),
      body: NewsListBody(
        news: newsData != null ? newsData!.newsList : [],
        refresh: () async {
          _page = 1;
          await _loadNews(query: _query);
        },
        loadMore: () async {
          _page++;
          _loadingMore = true;
          setState(() {});
          await _loadNews(query: _query);
          _loadingMore = false;
          setState(() {});
        },
        loadingMore: _loadingMore,
      ),
    );
  }

  _loadNews({required String query}) async {
    _isLoading = true;
    setState(() {});
    var news = await GetNewsService().getNews(
      query: _query,
      page: _page,
    );
    if (_page == 1) {
      newsData = news;
    } else {
      newsData ??= NewsResponseModel(newsList: []);
      newsData!.newsList.addAll(news!.newsList);
    }
    _isLoading = false;
    setState(() {});
  }
}
