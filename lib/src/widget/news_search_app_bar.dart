import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget buildNewsSearchAppBar({
  required BuildContext context,
  required ValueChanged<String>? onChanged,

  /// (String str) {...}
  required VoidCallback onSearch,

  /// () {...}
  bool isLoading = false,
}) {
  return PreferredSize(
    child: ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(36.0),
      ),
      child: Container(
        height: 69.0 + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(36.0),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 9.0),
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search news here...',
                              hintStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              suffixIcon: IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.search,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: onSearch,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            onChanged: onChanged,
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (isLoading)
                LinearProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
            ],
          ),
        ),
      ),
    ),
    preferredSize: const Size(
      double.infinity,
      69.0,
    ),
  );
}
