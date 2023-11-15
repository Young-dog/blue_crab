import 'package:flutter/material.dart';

import '../../app/app.dart';

enum Priority {
  critical,
  important,
  medium,
  low,
  deferred;

  String getText(AppLocale locale) {
    switch (this) {
      case Priority.critical:
        return locale.translations.priority_task.critical;
      case Priority.important:
        return locale.translations.priority_task.important;
      case Priority.medium:
        return locale.translations.priority_task.medium;
      case Priority.low:
        return locale.translations.priority_task.low;
      case Priority.deferred:
        return locale.translations.priority_task.deferred;
    }
  }

  Color getColor(Palette palette) {
    switch (this) {
      case Priority.critical:
        return palette.other.critical;
      case Priority.important:
        return palette.other.important;
      case Priority.medium:
        return palette.other.medium;
      case Priority.low:
        return palette.other.low;
      case Priority.deferred:
        return palette.other.deferred;
    }
  }
}
