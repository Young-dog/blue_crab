import 'package:flutter/material.dart';

import '../../../../../app/app.dart';
import '../../../../presentation.dart';

class SubtaskInput extends StatefulWidget {
  const SubtaskInput({
    required this.onSaved,
    this.finish = false,
    this.title = '',
    super.key,
  });

  final bool finish;
  final String title;
  final void Function({
    required String text,
    required bool checkBoxState,
    required TextEditingController controller,
  }) onSaved;

  @override
  State<SubtaskInput> createState() => _SubtaskInputState();
}

class _SubtaskInputState extends State<SubtaskInput> {
  late final TextEditingController _controller;

  late String _text;

  late bool _checkBoxState;

  @override
  void initState() {
    _text = widget.title;
    _checkBoxState = widget.finish;
    _controller = TextEditingController()..text = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.8,
          child: CheckboxTheme(
            data: const CheckboxThemeData(
              shape: CircleBorder(),
            ),
            child: Checkbox(
              value: _checkBoxState,
              onChanged: (value) {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    _checkBoxState = value ?? false;
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: FilledInput(
            style: theme.textTheme.bodyMedium!.copyWith(
              decoration: _checkBoxState ? TextDecoration.lineThrough : null,
            ),
            controller: _controller,
            hintText: t.common.subtask_input.hint_text,
            numLines: null,
            maxLength: 100,
            keyboardType: TextInputType.multiline,
            onChanged: (value) {
              setState(() {
                _text = value;
              });
            },
          ),
        ),
        SizedBox(
          width: theme.spacings.x2,
        ),
        if (widget.title != _text)
          Expanded(
            child: IconButton(
              onPressed: () {
                widget.onSaved(
                  text: _text,
                  checkBoxState: _checkBoxState,
                  controller: _controller,
                );
                setState(() {
                  _text = '';
                });
              },
              icon: Icon(
                Icons.add_circle,
                color: theme.palette.iconPrimary,
              ),
            ),
          ),
      ],
    );
  }
}
