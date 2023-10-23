import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalBlocInjector extends StatelessWidget {
  const GlobalBlocInjector({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return/* MultiBlocProvider(
      providers: const [],
      child: */child;
    // );
  }
}
