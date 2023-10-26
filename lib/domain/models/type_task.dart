import '../../app/app.dart';

enum TypeTask {
  task,
  event;

  String toText(AppLocale locale) {
    switch (this) {
      case TypeTask.task:
        return locale.translations.task_type.task;
      case TypeTask.event:
        return locale.translations.task_type.event;
    }
  }
}
