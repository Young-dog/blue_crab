import 'package:flutter/material.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';

class DescriptionsInput extends StatelessWidget {
  const DescriptionsInput({
    required this.title,
    required this.onChanged,
    super.key,
  });

  final String title;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return FilledInput(
      initialValue: title,
      onChanged: onChanged,
      labelText: t.common.descriptions_input,
    );
  }
}
