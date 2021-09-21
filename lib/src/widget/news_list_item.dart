import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/views/news_detail_view.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({Key? key}) : super(key: key);

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
              'https://www.usnews.com/dims4/USNEWS/2e826ce/2147483647/thumbnail/970x647/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2Fbe%2Fc175c943474e78ec8a41bc0ec3e315%2Fmedia%3Ad97a6dbe3af6439b94d8dbac70e0a0f0US_Open_Tennis_71457.jpg',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '\'Relief\': Djokovic\'s Bid for Year Slam Ends Against Medvedev',
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
