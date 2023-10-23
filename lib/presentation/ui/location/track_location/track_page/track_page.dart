import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../presentation.dart';
import 'views/views.dart';

@RoutePage()
class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TrackView(),
      bottomNavigationBar: NavigateBottomBar(),
    );
  }
}
