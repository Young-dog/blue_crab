import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';

class TaskButton extends StatefulWidget {
  const TaskButton({
    required this.task,
    required this.index,
    required this.finish,
    super.key,
  });

  final TaskModel task;

  final bool finish;

  final int index;

  @override
  State<TaskButton> createState() => _TaskButtonState();
}

class _TaskButtonState extends State<TaskButton> {
  double _xOffset = 0.0;

  Task? task;

  Event? event;

  @override
  void initState() {
    if (widget.task.type == TypeTask.event) {
      event = widget.task as Event;
    } else {
      task = widget.task as Task;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          _xOffset += details.delta.dx;
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_xOffset < -25) {
          context.read<TasksBloc>().add(
                DelTasksEvent(
                  task: widget.task, type: widget.task.type,
                ),
              );
        } else if (_xOffset > 25) {
          context.read<TasksBloc>().add(
                FinishTaskEvent(
                  type: widget.task.type,
                  task: widget.task,
                ),
              );
        }
        setState(() {
          _xOffset = 0.0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(_xOffset, 0.0, 0.0),
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.all(
              theme.radius.x4,
            ),
            onTap: () {
              context.pushRoute(
                TaskRoute(
                  task: widget.task,
                  index: widget.index,
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                bottom: theme.spacings.x1,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: theme.spacings.x2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  theme.radius.x4,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.scale(
                        alignment: Alignment.centerLeft,
                        scale: 0.8,
                        child: CheckboxTheme(
                          data: const CheckboxThemeData(
                            shape: CircleBorder(),
                          ),
                          child: Checkbox(
                            value: widget.finish,
                            onChanged: (value) {
                              context.read<TasksBloc>().add(
                                    FinishTaskEvent(
                                      task: widget.task,type: widget.task.type,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.task.title,
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: widget.task.type == TypeTask.event ? theme.palette.other.low : null,
                            decoration: widget.finish
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      ),
                      if (widget.task.priority != null)
                        FaIcon(
                          FontAwesomeIcons.warning,
                          color: widget.task.priority!.getColor(
                            theme.palette,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      if (widget.task.tag != null)
                        TagPin(
                          tag: widget.task.tag!,
                        ),
                      if(event?.days.isNotEmpty ?? false)
                        const RepeatPin(),
                      if (widget.task.timeStart != null)
                        TimePin(
                          time: widget.task.timeStart!,
                        ),
                      if (task?.timeEnd != null &&
                          task?.timeStart != null)
                        Icon(
                          Icons.navigate_next,
                          color: theme.palette.iconPrimary,
                        ),
                      if (task?.timeEnd != null)
                        TimePin(
                          time: task!.timeEnd!,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
