import 'package:flutter/material.dart';
import 'package:outtappxperience/config/theme/app_theme/color_scheme.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/config/theme/app_theme/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class MusicAppTheme{
  static final appTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    colorScheme: MusicAppColorScheme.colorScheme,
    textTheme: MusicAppTextTheme.textTheme,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    scaffoldBackgroundColor: MusicAppColors.white
  );
}