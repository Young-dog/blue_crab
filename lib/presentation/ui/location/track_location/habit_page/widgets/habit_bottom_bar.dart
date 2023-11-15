import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class HabitBottomBar extends StatelessWidget {
  const HabitBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mq = MediaQuery.of(context);

    return BlocBuilder<HabitBloc, HabitState>(
      builder: (context, state) {
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
                      PriorityButton(
                        onChanged: (priority) {
                          context.read<HabitBloc>().add(
                                ChangePriorityHabitEvent(
                                  priority: priority,
                                ),
                              );
                        },
                        priority: state.priority,
                      ),
                      TagButton(
                        tag: state.tag,
                        onChanged: (tag) {
                          context.read<HabitBloc>().add(
                                ChangeTagHabitEvent(
                                  tag: tag,
                                ),
                              );
                        },
                      ),
                      const NotifyButton(),
                      RepeatButton(
                        days: state.days,
                        onChanged: (days) {
                          context.read<HabitBloc>().add(
                                ChangeDaysHabitEvent(
                                  days: days,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
