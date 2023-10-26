import 'package:flutter/material.dart';

import '../../app/app.dart';

enum PriorityTask {
  critical,
  important,
  medium,
  low,
  deferred;

  String getText(AppLocale locale) {
    switch (this) {
      case PriorityTask.critical:
        return locale.translations.priority_task.critical;
      case PriorityTask.important:
        return locale.translations.priority_task.important;
      case PriorityTask.medium:
        return locale.translations.priority_task.medium;
      case PriorityTask.low:
        return locale.translations.priority_task.low;
      case PriorityTask.deferred:
        return locale.translations.priority_task.deferred;
    }
  }

  Color getColor(Palette palette) {
    switch (this) {
      case PriorityTask.critical:
        return palette.other.critical;
      case PriorityTask.important:
        return palette.other.important;
      case PriorityTask.medium:
        return palette.other.medium;
      case PriorityTask.low:
        return palette.other.low;
      case PriorityTask.deferred:
        return palette.other.deferred;
    }
  }
}
