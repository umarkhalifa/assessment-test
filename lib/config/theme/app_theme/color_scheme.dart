import 'package:flutter/material.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';

@immutable
class MusicAppColorScheme {
  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: MusicAppColors.black,
    onPrimary: MusicAppColors.white,
    secondary: MusicAppColors.grey,
    onSecondary: MusicAppColors.black,
    error: Colors.red,
    onError:MusicAppColors.white,
    background: MusicAppColors.white,
    onBackground: MusicAppColors.black,
    surface: MusicAppColors.white,
    onSurface: MusicAppColors.black,
  );
}
