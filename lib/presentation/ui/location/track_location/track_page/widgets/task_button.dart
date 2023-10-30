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
    super.key,
  });

  final Task task;

  final int index;

  @override
  State<TaskButton> createState() => _TaskButtonState();
}

class _TaskButtonState extends State<TaskButton> {
  double _xOffset = 0.0;

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
                  index: widget.index,
                ),
              );
        } else if (_xOffset > 25) {
          context.read<TasksBloc>().add(
                FinishTaskEvent(
                  finish: !widget.task.finish,
                  index: widget.index,
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
                            value: widget.task.finish,
                            onChanged: (value) {
                              context.read<TasksBloc>().add(
                                    FinishTaskEvent(
                                      index: widget.index,
                                      finish: value ?? false,
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
                            decoration: widget.task.finish
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
                      if (widget.task.timeStart != null)
                        TimePin(
                          time: widget.task.timeStart!,
                        ),
                      if (widget.task.timeEnd != null &&
                          widget.task.timeStart != null)
                        Icon(
                          Icons.navigate_next,
                          color: theme.palette.iconPrimary,
                        ),
                      if (widget.task.timeEnd != null)
                        TimePin(
                          time: widget.task.timeEnd!,
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
