import 'package:flutter/material.dart';

import '../../../../../app/app.dart';

class SubtaskInput extends StatefulWidget {
  const SubtaskInput({
    required this.onSaved,
    this.finish = false,
    this.title = '',
    this.controller,
    super.key,
  });

  final TextEditingController? controller;
  final bool finish;
  final String title;
  final void Function({
    required String text,
    required bool checkBoxState,
  }) onSaved;

  @override
  State<SubtaskInput> createState() => _SubtaskInputState();
}

class _SubtaskInputState extends State<SubtaskInput> {
  late String _text;

  late bool _checkBoxState;

  @override
  void initState() {
    _text = widget.title;
    _checkBoxState = widget.finish;
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
              activeColor: Colors.transparent,
              value: widget.finish,
              onChanged: (value) {
                setState(() {
                  _checkBoxState = value ?? false;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            initialValue: widget.title,
            maxLines: null,
            maxLength: 100,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              counterText: '',
              hintText: t.subtask_input.hint_text,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
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
        if (widget.title != (widget.controller?.text ?? widget.title))
          IconButton(
            onPressed: () {
              widget.onSaved(text: _text, checkBoxState: _checkBoxState,);
            },
            icon: Icon(
              Icons.add_circle,
              color: theme.palette.iconPrimary,
            ),
          ),
      ],
    );
  }
}
