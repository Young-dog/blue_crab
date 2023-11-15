import 'package:flutter/material.dart';

import '../../../../app/app.dart';

class CountRepitModal extends StatelessWidget {
  const CountRepitModal({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(theme.spacings.x4),
          ),
          color: theme.palette.bgPrimary,
        ),
        constraints: BoxConstraints(
          minHeight: theme.spacings.x20,
          maxHeight: theme.spacings.x20 * 5,
        ),
        padding: const EdgeInsets.only(top: 6.0),
        child: Padding(
          padding: EdgeInsets.all(theme.spacings.x4),
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
