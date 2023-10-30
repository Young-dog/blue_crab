import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final tasks = Hive.box<Task>(HiveBoxes.taskBox);

    return ValueListenableBuilder(
      valueListenable: tasks.listenable(),
      builder: (BuildContext context, value, _) {
        final finishElements = tasks.values
            .where(
              (e) => e.finish,
            )
            .toList();

        return TrackBox(
          finishElements: finishElements.length,
          countElements: tasks.length,
          icon: AssetNames.taskIcon,
          title: t.track_page.tasks_box_title,
          colorIcon: theme.palette.iconPrimary,
          onPressedAdd: () {
            context.router.push(
              const TaskRoute(),
            );
          },
          child: tasks.isNotEmpty
              ? ListView.builder(
            padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  physics: const NeverScrollableScrollPhysics(),

                  itemBuilder: (BuildContext context, int index) {
                    final task = tasks.values.elementAt(index);

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          theme.radius.x2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: task.finish,
                            onChanged: (value) {},
                          ),
                          Expanded(
                            child: Text(task.title,),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container(),
        );
      },
    );
  }
}
