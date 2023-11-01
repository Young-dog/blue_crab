import 'package:flutter/material.dart';

import '../../../../app/app.dart';
import '../../../../domain/domain.dart';

class TagPin extends StatelessWidget {
  const TagPin({
    required this.tag,
    super.key,
  });

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: theme.spacings.x1,
          horizontal: theme.spacings.x2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            theme.radius.x4,
          ),
          boxShadow: [
            BoxShadow(
              color: tag.color.withOpacity(
                0.5,
              ),
            ),
          ],
        ),
        child: Text(
          t.task_button.tag_title(tag: tag.title),
          style: theme.textTheme.labelSmall!.copyWith(
            color: theme.palette.textPrimary,
          ),
        ),
      ),
    );
  }
}
