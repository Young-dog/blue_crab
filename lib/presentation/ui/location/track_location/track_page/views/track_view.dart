import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class TrackView extends StatelessWidget {
  const TrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBloc, TrackState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            TrackAppBar(
              selectDate: state.selectedDate,
              focusDay: state.focusedDay,
            ),
            const SliverToBoxAdapter(
              child: HabitsBox(),
            ),
            const SliverToBoxAdapter(
              child: PurposesBox(),
            ),
            const SliverToBoxAdapter(
              child: TaskBox(),
            ),
          ],
        );
      },
    );
  }
}
