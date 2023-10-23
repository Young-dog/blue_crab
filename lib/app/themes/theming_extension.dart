import 'package:flutter/material.dart';
import '../app.dart';
extension ThemingExtension on ThemeData {
  Palette get palette => extension<Palette>()!;
  Radiuses get radius => extension<Radiuses>()!;
  Spacings get spacings => extension<Spacings>()!;
}
