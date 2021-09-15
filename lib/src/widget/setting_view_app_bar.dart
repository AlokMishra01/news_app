import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget buildSettingViewAppBar({required BuildContext context}) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.settings,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.transparent,
                ),
                onPressed: () {},
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
