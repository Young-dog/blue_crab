import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';
import '../../../../../domain/domain.dart';
import '../../../../presentation.dart';

class PriorityButton extends StatelessWidget {
  const PriorityButton({
    required this.onChanged,
    required this.priority,
    super.key,
  });

  final void Function(Priority priority) onChanged;
  final Priority? priority;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () async {
        await _openPriorityListMenu(context);
      },
      icon: FaIcon(
        FontAwesomeIcons.warning,
        color: priority == null
            ? theme.palette.buttonPrimary
            : priority!.getColor(theme.palette),
      ),
    );
  }

  Future<void> _openPriorityListMenu(BuildContext ctx) async {
    final theme = Theme.of(ctx);

    const priorities = Priority.values;

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(theme.spacings.x4),
        ),
      ),
      context: ctx,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: theme.spacings.x20 * 5,
          ),
          child: _PriorityModal(
            priorities: priorities,
            onChanged: onChanged,
          ),
        );
      },
    );
  }
}

class _PriorityModal extends StatelessWidget {
  const _PriorityModal({
    required this.priorities,
    required this.onChanged,
  });

  final List<Priority> priorities;
  final void Function(Priority priority) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final priority = priorities[index];

        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: theme.spacings.x4,
            vertical: theme.spacings.x2,
          ),
          child: InkWell(
            onTap: () {
              onChanged(priority);
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.all(
              theme.radius.x4,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                theme.spacings.x2,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: priority.getColor(
                      theme.palette,
                    ),
                  ),
                  SizedBox(
                    width: theme.spacings.x2,
                  ),
                  Text(
                    priority.getText(
                      AppLocaleUtils.findDeviceLocale(),
                    ),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: priority.getColor(
                        theme.palette,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: priorities.length,
    );
  }
}
