import 'package:flutter/material.dart';

import '../widget/news_detail_app_bar.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({Key? key}) : super(key: key);

  static const routeName = '/newsDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: buildNewsDetailAppBar(
        context: context,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 80.0,
          left: 8.0,
          right: 8.0,
        ),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                const Text(
                  '\'Relief\': Djokovic\'s Bid for Year Slam Ends Against Medvedev',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    'https://www.usnews.com/dims4/USNEWS/2e826ce/2147483647/thumbnail/970x647/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2Fbe%2Fc175c943474e78ec8a41bc0ec3e315%2Fmedia%3Ad97a6dbe3af6439b94d8dbac70e0a0f0US_Open_Tennis_71457.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  newsDetail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String newsDetail = 'NEW YORK (AP) — A game from the end of his bid for '
    'what would have been the first calendar-year Grand Slam in men’s tennis '
    'since 1969, Novak Djokovic covered his face with a towel, hiding his '
    'tears during a changeover.\nFor 27 Grand Slam matches in 2021, on hard '
    'courts, clay courts and grass, Djokovic could not be deterred, could not '
    'be beaten. Needing one more victory, in the U.S. Open final Sunday '
    'against Daniil Medvedev, to complete a season sweep of major titles and '
    'to claim the record 21st of his career, Djokovic could not come through.'
    '\nOutplayed by someone using a similar style to his own, Djokovic came '
    'up just short of those two historic milestones, losing 6-4, 6-4, 6-4 to '
    'first-time major champion Medvedev at Arthur Ashe Stadium.\nWhat was in '
    'Djokovic\'s thoughts as he sat there on the sideline, knowing full well '
    'that his quest was moments from its conclusion?\n“Relief. I was glad it '
    'was over, because the buildup for this tournament, and everything that '
    'mentally, emotionally, I had to deal with throughout the tournament in '
    'the last couple of weeks, was just a lot. It was a lot to handle,” '
    'Djokovic said at his news conference. “I was just glad that, finally, '
    'the run is over. At the same time, I felt sadness, disappointment — and '
    'also gratitude for the crowd and for that special moment that they’ve '
    'created for me on the court.”\nUntil Sunday, the No. 1-ranked Djokovic '
    'had been sublime at the sport’s four most important tournaments, '
    'enduring the burdens of expectations and pressure over the past seven '
    'months and, in New York, the past fortnight.\nHe won the Australian Open '
    'in February, beating Medvedev in the final in straight sets, the French '
    'Open in June and Wimbledon in July, pulling even with Rafael Nadal and '
    'Roger Federer at 20 Grand Slam titles, the most for a man in the history '
    'of a sport that dates to the 1800s.\nThe last man to complete a true '
    'Grand Slam by going 4 for 4 at the majors in a single season remains Rod '
    'Laver, who did it twice — in 1962 and 1969 — and was in the stands '
    'Sunday. The last woman to accomplish the feat was Steffi Graf in 1988.'
    '\nInstead, Djokovic joins Jack Crawford in 1933 and Lew Hoad in 1956 as '
    'men who won a year’s first trio of Grand Slam tournaments and made it '
    'all the way to the U.S. Open final before losing.\n“I do feel sorry for '
    'Novak, because I cannot imagine what he feels,” said Medvedev, a '
    '25-year-old from Russia who had been 0-2 in major finals. “Knowing that '
    'I managed to stop him, it definitely makes it sweeter, and brings me '
    'confidence for what is to come.”\nDjokovic, a 34-year-old from Serbia, '
    'simply was far from his best on this particular day.\n“Just energy-wise, '
    'I felt slow,” said Djokovic, who could not create the kind of comeback '
    'he had in each of his previous four matches — and six others in Grand '
    'Slam action this year — when he dropped the opening set.\n"I know I '
    'could have, and should have, done better,” he said.\nDjokovic made '
    'plenty of mistakes, 38 unforced errors in all. He wasn’t able to convert '
    'a break chance until it was too little, too late, going just 1 for 6. '
    'He showed frustration, too, destroying his racket by pounding it three '
    'times against the court after one point, drawing boos from the crowd of '
    '25,703 and a code violation from chair umpire Damien Dumusois.\nA lot of '
    'Djokovic’s issues also had to do with the No. 2-ranked Medvedev, who '
    'used his 6-foot-6 (1.98-meter) frame to chase down everything and '
    'respond with seemingly effortless groundstrokes — much the way Djokovic '
    'wears down foes — and delivered pinpoint serving.\n“He was amazing. Just '
    'congratulate him, full credit from his mentality, his approach, his '
    'game, everything,” Djokovic said. “He absolutely was the better player '
    'and deserved to win, no doubt about it.”\nMedvedev won 20 of his first '
    '23 service points, establishing a pattern. He finished with 16 aces and '
    '38 winners in all, 11 more than Djokovic. And Medvedev employed a '
    'strategy his coach, Gilles Cervara, described as hitting more balls down '
    'the middle of the court, rather than trying to find angles that would '
    'Djokovic to pick up balls on the run.\n“He’s so good that every match is '
    'different. He changes his tactics, he changes his approach,” Medvedev '
    'said about Djokovic.\n“I had a clear plan, which did seem to work. Was '
    'he at his best? Maybe not today. He had a lot of pressure,” Medvedev '
    'said. “I had a lot of pressure, too.”\nNerves, distracting noise from '
    'spectators and cramps that started in his legs got to Medvedev at the '
    'very end. He served for the match at 5-2 and was a point from winning '
    'before double-faulting twice in a row. At 5-4, he had a second match '
    'point and double-faulted again. On the next chance, though, a 129 mph '
    'service winner finally finished the job, and Medvedev toppled over to '
    'the court on his side with his tongue hanging out, which he explained '
    'afterward was inspired by a goal celebration from a soccer video game.'
    '\nDuring the trophy presentation, Medvedev addressed Djokovic, offering '
    'praise for “what you accomplished this year and throughout your career” '
    'and adding, “I never said this to anybody, but I’ll say it right now: For '
    'me, you are the greatest tennis player in history.”\nIn recent years, '
    'there has been constant discussion and debate about which member of the '
    'so-called Big Three — Federer, who turned 40 last month, Nadal, 35, or '
    'Djokovic — deserves to be considered the best of the bunch and the '
    '“GOAT” (“Greatest of All Time”).\nEven with Sunday\'s setback, Djokovic '
    'has accumulated statistics that help people make the case for him. He is '
    'the only one of that dominant trio to have won four majors in a row '
    'across two seasons, in 2015-16. He is the only one with at least two '
    'titles at each major tournament. He is the only player who has won each '
    'of the next-tier Masters 1000 events at least twice, too. He has spent '
    'more weeks than anyone at No. 1 since the ATP computerized rankings '
    'began in 1973, surpassing Federer for that accolade in March. And he '
    'holds the edge in head-to-head matchups against both of his long-time '
    'rivals.\nAfter a five-set win over Tokyo Olympics gold medalist Alexander '
    'Zverev on Friday night, Djokovic looked ahead to what awaited in the '
    'final and declared, "I’m going to put my heart and my soul and my body '
    'and my head into that one. I’m going to treat the next match like it is '
    'the last match of my career.”\nBut Medvedev, who lost only one set in '
    'the entire tournament, never allowed Djokovic to get into this match.'
    '\nFrom the start, Djokovic was not quite himself. After flubbing three '
    'break points early in the second set, the last with a sliced backhand in '
    'the net, he pounded his racket against his thigh — one, two, three, four '
    'times, perhaps as disappointed in his footwork as his form.\nThousands '
    'in the audience tried to boost him by chanting his nickname, “No-le! '
    'No-le! No-le!” After some of Medvedev’s faults, some in the stands would '
    'applaud, considered poor form in tennis and repeatedly admonished with a '
    '“please” from Dumusois.\nBy the end, the deficit grew too large for '
    'Djokovic, the climb too steep.\n“I was below par with everything, to be '
    'honest,” he said. “So just one of these days where, unfortunately, '
    'wasn’t meant to be.”';
