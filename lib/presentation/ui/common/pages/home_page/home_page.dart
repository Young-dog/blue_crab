import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'views/views.dart';


@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}