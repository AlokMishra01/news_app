import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/src/views/news_detail_view.dart';

class NewsListItem extends StatelessWidget {
  final NewsModel news;

  const NewsListItem({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              news.image ?? '',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            news.title ?? '',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    AppLocalizations.of(context)!.minutesAgo(26),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.restorablePushNamed(
                    context,
                    NewsDetailView.newsDetailRoute,
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.read,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
