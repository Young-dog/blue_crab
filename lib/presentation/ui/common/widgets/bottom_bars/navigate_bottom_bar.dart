import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';

class NavigateBottomBar extends StatelessWidget {
  const NavigateBottomBar({
    required this.tabsRouter,
    super.key,
  });

  final TabsRouter tabsRouter;

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
                    onPressed: () {
                      _onTap(0, tabsRouter);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.calendar,
                      color: theme.palette.buttonPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onTap(1, tabsRouter);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.creditCard,
                      color: theme.palette.buttonPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onTap(2, tabsRouter);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.search,
                      color: theme.palette.buttonPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onTap(3, tabsRouter);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.cogs,
                      color: theme.palette.buttonPrimary,
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

  void _onTap(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
