import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';

class TaskBottomBar extends StatelessWidget {
  const TaskBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mq = MediaQuery.of(context);

    return BlocBuilder<TaskBloc, TaskState>(
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
                          context.read<TaskBloc>().add(
                                ChangePriorityTaskEvent(
                                  priority: priority,
                                ),
                              );
                        },
                        priority: state.priority,
                      ),
                      TagButton(
                        tag: state.tag,
                        onChanged: (tag) {},
                      ),
                      const NotifyButton(),
                      if (state.type == TypeTask.event)
                        RepeatButton(
                          days: state.days,
                        ),
                      CalendarButton(
                        date: state.dateStart,
                        time: state.timeStart,
                        onChangedTime: (TimeOfDay? time) {
                          context.read<TaskBloc>().add(
                                ChangeTimeStartTaskEvent(
                                  time: time,
                                ),
                              );
                        },
                        onChangedDate: (DateTime? date) {
                          context.read<TaskBloc>().add(
                                ChangeDateStartTaskEvent(
                                  date: date,
                                ),
                              );
                        },
                        days: state.days,
                      ),
                      if (state.type != TypeTask.event &&
                          state.dateStart != null)
                        Row(
                          children: [
                            Icon(
                              Icons.navigate_next,
                              color: theme.palette.iconPrimary,
                            ),
                            CalendarButton(
                              date: state.dateEnd,
                              time: state.timeEnd,
                              onChangedTime: (TimeOfDay? time) {
                                context.read<TaskBloc>().add(
                                      ChangeTimeEndTaskEvent(
                                        time: time,
                                      ),
                                    );
                              },
                              onChangedDate: (DateTime? date) {
                                context.read<TaskBloc>().add(
                                      ChangeDateEndTaskEvent(
                                        date: date,
                                      ),
                                    );
                              },
                            ),
                          ],
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
