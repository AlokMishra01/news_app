import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/api/get_news.dart';
import 'package:news_app/models/news_response_model.dart';

import '../widget/news_list_app_bar.dart';
import 'news_list_body.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  static const newsListRoute = '/';

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildNewsListAppBar(context: context),
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(36.0),
              ),
              child: Material(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(36.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TabBar(
                    physics: const BouncingScrollPhysics(),
                    indicatorColor: Theme.of(context).primaryColor,
                    isScrollable: true,
                    labelColor: Theme.of(context).focusColor,
                    unselectedLabelColor: Theme.of(context).disabledColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 6.0,
                    labelStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(text: AppLocalizations.of(context)!.all),
                      Tab(text: AppLocalizations.of(context)!.political),
                      Tab(text: AppLocalizations.of(context)!.business),
                      Tab(text: AppLocalizations.of(context)!.health),
                      Tab(text: AppLocalizations.of(context)!.sports),
                      Tab(text: AppLocalizations.of(context)!.nepali),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  if (_loading)
                    const Center(child: CircularProgressIndicator()),
                  if (!_loading)
                    NewsListBody(
                      news: newsData != null ? newsData!.newsList : [],
                      refresh: () async {
                        _page = 1;
                        await _loadNews();
                      },
                      loadMore: () async {
                        _page++;
                        _loadingMore = true;
                        setState(() {});
                        await _loadNews();
                        _loadingMore = false;
                        setState(() {});
                      },
                      loadingMore: _loadingMore,
                    ),
                  if (_politicalLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (!_politicalLoading)
                    NewsListBody(
                      news: politicalNewsData != null
                          ? politicalNewsData!.newsList
                          : [],
                      refresh: () async {
                        _politicalPage = 1;
                        await _politicalLoadNews();
                      },
                      loadMore: () async {
                        _politicalPage++;
                        await _politicalLoadNews();
                      },
                    ),
                  if (_businessLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (!_businessLoading)
                    NewsListBody(
                      news: businessNewsData != null
                          ? businessNewsData!.newsList
                          : [],
                      refresh: () async {
                        _businessPage = 1;
                        await _businessLoadNews();
                      },
                      loadMore: () async {
                        _businessPage++;
                        await _businessLoadNews();
                      },
                    ),
                  if (_healthLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (!_healthLoading)
                    NewsListBody(
                      news: healthNewsData != null
                          ? healthNewsData!.newsList
                          : [],
                      refresh: () async {
                        _healthPage = 1;
                        await _healthLoadNews();
                      },
                      loadMore: () async {
                        _healthPage++;
                        await _healthLoadNews();
                      },
                    ),
                  if (_sportsLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (!_sportsLoading)
                    NewsListBody(
                      news: sportsNewsData != null
                          ? sportsNewsData!.newsList
                          : [],
                      refresh: () async {
                        _sportsPage = 1;
                        await _sportsLoadNews();
                      },
                      loadMore: () async {
                        _sportsPage++;
                        await _sportsLoadNews();
                      },
                    ),
                  if (_nepalLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (!_nepalLoading)
                    NewsListBody(
                      news:
                          nepalNewsData != null ? nepalNewsData!.newsList : [],
                      refresh: () async {
                        _nepalPage = 1;
                        await _nepaliLoadNews();
                      },
                      loadMore: () async {
                        _nepalPage++;
                        await _nepaliLoadNews();
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadNews();
    _politicalLoadNews();
    _businessLoadNews();
    _healthLoadNews();
    _sportsLoadNews();
    _nepaliLoadNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  NewsResponseModel? newsData;
  bool _loading = true;
  bool _loadingMore = false;
  int _page = 1;
  NewsResponseModel? politicalNewsData;
  bool _politicalLoading = true;
  int _politicalPage = 1;
  NewsResponseModel? businessNewsData;
  bool _businessLoading = true;
  int _businessPage = 1;
  NewsResponseModel? healthNewsData;
  bool _healthLoading = true;
  int _healthPage = 1;
  NewsResponseModel? sportsNewsData;
  bool _sportsLoading = true;
  int _sportsPage = 1;
  NewsResponseModel? nepalNewsData;
  bool _nepalLoading = true;
  int _nepalPage = 1;

  _loadNews() async {
    var news = await GetNewsService().getNews(
      page: _page,
    );
    if (_page == 1) {
      newsData = news;
    } else {
      newsData ??= NewsResponseModel(newsList: []);
      newsData!.newsList.addAll(news!.newsList);
    }
    _loading = false;
    setState(() {});
  }

  _politicalLoadNews() async {
    var news = await GetNewsService().getNews(
      query: 'political',
      page: _politicalPage,
    );
    if (_politicalPage == 1) {
      politicalNewsData = news;
    } else {
      politicalNewsData!.newsList.addAll(news!.newsList);
    }
    _politicalLoading = false;
    setState(() {});
  }

  _businessLoadNews() async {
    var news = await GetNewsService().getNews(
      query: 'business',
      page: _businessPage,
    );
    if (_businessPage == 1) {
      businessNewsData = news;
    } else {
      businessNewsData!.newsList.addAll(news!.newsList);
    }
    _businessLoading = false;
    setState(() {});
  }

  _healthLoadNews() async {
    var news = await GetNewsService().getNews(
      query: 'health',
      page: _healthPage,
    );
    if (_healthPage == 1) {
      healthNewsData = news;
    } else {
      healthNewsData!.newsList.addAll(news!.newsList);
    }
    _healthLoading = false;
    setState(() {});
  }

  _sportsLoadNews() async {
    var news = await GetNewsService().getNews(
      query: 'sports',
      page: _sportsPage,
    );
    if (_sportsPage == 1) {
      sportsNewsData = news;
    } else {
      sportsNewsData!.newsList.addAll(news!.newsList);
    }
    _sportsLoading = false;
    setState(() {});
  }

  _nepaliLoadNews() async {
    var news = await GetNewsService().getNews(
      query: 'nepali',
      page: _nepalPage,
    );
    if (_nepalPage == 1) {
      nepalNewsData = news;
    } else {
      nepalNewsData!.newsList.addAll(news!.newsList);
    }
    _nepalLoading = false;
    setState(() {});
  }
}
