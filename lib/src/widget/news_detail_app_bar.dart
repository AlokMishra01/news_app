import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget buildNewsDetailAppBar({required BuildContext context}) {
  return PreferredSize(
    child: Container(
      height: 80.0 + MediaQuery.of(context).padding.top,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(36.0),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 4.0),
                    const Text(
                      '\'Relief\': Djokovic\'s Bid for Year Slam Ends Against Medvedev',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.red,
                          size: 20.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '24 Minutes Ago',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    preferredSize: const Size(
      double.infinity,
      80.0,
    ),
  );
}
