import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';

class NavigateBottomBar extends StatelessWidget {
  const NavigateBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mq = MediaQuery.of(context);

    return SafeArea(
      child: SizedBox(
        width: mq.size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: theme.spacings.x4,
                vertical: theme.spacings.x2,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.palette.iconPrimary,
                ),
                borderRadius: BorderRadius.all(
                  theme.radius.x8,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.calendar,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.creditCard,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.search,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.cogs,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
