import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../app/app.dart';
import '../../../../../domain/domain.dart';
import '../../../../presentation.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    required this.tag,
    required this.onChanged,
    super.key,
  });

  final Tag? tag;

  final void Function(Tag tag) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () async {
        await _openTagsListMenu(context);
      },
      icon: FaIcon(
        FontAwesomeIcons.tag,
        color: tag == null ? theme.palette.buttonPrimary : tag!.color,
      ),
    );
  }

  Future<void> _openTagsListMenu(BuildContext ctx) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(theme.spacings.x4),
        ),
      ),
      context: ctx,
      builder: (context) {
          return SafeArea(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: theme.spacings.x20 * 5,
              ),
              child: BlocProvider(
                create: (context) => TagsBloc(
                  tagsRepository: GetIt.instance(),
              ),
              child:  _TagsModal(onChanged: onChanged,),
            ),
          ),
          );
      },
    );
  }
}

class _TagsModal extends StatefulWidget {
  const _TagsModal({required this.onChanged});


  final void Function(Tag tag) onChanged;

  @override
  State<_TagsModal> createState() => _TagsModalState();
}

class _TagsModalState extends State<_TagsModal> {

  late final TextEditingController _controller;


  final _tags = Hive.box<Tag>(HiveBoxes.tagsBox);

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TagsBloc, TagsState>(
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable: _tags.listenable(),
          builder: (context, value, _) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: theme.spacings.x10,
                            margin: EdgeInsets.symmetric(
                              vertical: theme.spacings.x2,
                              horizontal: theme.spacings.x2,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: theme.spacings.x1,
                              horizontal: theme.spacings.x2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.palette.bgPrimary,
                              borderRadius: BorderRadius.all(
                                theme.radius.x8,
                              ),
                              border: Border.all(
                                color: theme.palette.iconPrimary,
                              ),
                            ),
                            child: FilledInput(
                              controller: _controller,
                              onChanged: (value) {
                                context.read<TagsBloc>().add(
                                      TagChangeTitleEvent(
                                        title: value,
                                      ),
                                    );
                              },
                              numLines: 1,
                              maxLength: 25,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: theme.spacings.x5,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  _showColor(
                                    context: context,
                                    color: state.color,
                                    onChanged: (value) {
                                      context.read<TagsBloc>().add(
                                            TagChangeColorEvent(
                                              color: value,
                                            ),
                                          );
                                    },
                                  );
                                },
                                child: Container(
                                  height: theme.spacings.x7,
                                  width: theme.spacings.x7,
                                  decoration: BoxDecoration(
                                    color: state.color,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: theme.palette.iconSecondary,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TagsBloc>().add(
                              const TagAddEvent(),
                            );
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: theme.palette.buttonPrimary,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _tags.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    final tag = _tags.values.elementAt(index);

                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Dismissible(
                        onDismissed: (direction) {
                          context.read<TagsBloc>().add(
                                TagDelEvent(
                                  index: index,
                                ),
                              );
                        },
                        key: Key(tag.title),
                        direction: DismissDirection.endToStart,
                        child: InkWell(
                          onTap: () {
                            widget.onChanged(tag);
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                              theme.spacings.x2,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: theme.spacings.x2,
                              horizontal: theme.spacings.x4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                theme.radius.x4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: tag.color.withOpacity(
                                    0.5,
                                  ),
                                ),
                              ],
                            ),
                            child: Text(
                              t.common.tag_button.tag_title(tag: tag.title),
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.palette.textPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showColor({
    required BuildContext context,
    required Color color,
    required void Function(Color color) onChanged,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: color,
              onColorChanged: (Color value) {
                onChanged(value);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
