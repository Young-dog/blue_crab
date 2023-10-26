import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const TaskAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
          vertical: theme.spacings.x2,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            TitleInput(),
            DescriptionsInput(),
          ],
        ),
      ),
      bottomNavigationBar: const TaskBottomBar(),
    );
  }
}
