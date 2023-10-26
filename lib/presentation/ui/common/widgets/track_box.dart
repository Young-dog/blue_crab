import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../app/app.dart';

class TrackBox extends StatelessWidget {
  const TrackBox({
    required this.icon,
    required this.title,
    required this.colorIcon,
    required this.onPressedAdd,
    this.countElements = 0,
    this.finishElements = 0,
    this.maxHeight,
    super.key,
  });

  final String icon;
  final String title;
  final Color colorIcon;
  final double? maxHeight;
  final int finishElements;
  final int countElements;
  final void Function() onPressedAdd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? theme.spacings.x20 * 2,
      ),
      margin: EdgeInsets.symmetric(
        vertical: theme.spacings.x4,
        horizontal: theme.spacings.x6,
      ),
      padding: EdgeInsets.symmetric(
        vertical: theme.spacings.x1,
        horizontal: theme.spacings.x2,
      ),
      decoration: BoxDecoration(
        color: theme.palette.bgContrast,
        borderRadius: BorderRadius.all(
          theme.radius.x4,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                color: colorIcon,
              ),
              SizedBox(
                width: theme.spacings.x2,
              ),
              Text(
                title,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: theme.spacings.x2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: theme.spacings.x1,
                  horizontal: theme.spacings.x2,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    theme.radius.x3,
                  ),
                  border: Border.all(
                    color: theme.palette.iconSecondary,
                  ),
                ),
                child: Text(
                  '$finishElements/$countElements',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: theme.palette.textSecondary,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onPressedAdd,
                icon: Icon(
                  Icons.add_circle,
                  color: theme.palette.iconPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
