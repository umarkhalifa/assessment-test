import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/spacing.dart';

class MusicTextField extends StatelessWidget {
  final String label;
  final String? prefixText;

  const MusicTextField({super.key, required this.label, this.prefixText});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            label,
            style: textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
        ),
        gapH5,
        TextFormField(
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 51.h, maxWidth: 359),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MusicAppColors.grey400, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MusicAppColors.black, width: 0.5),
            ),
            hintText: prefixText,
            hintStyle: textTheme.bodySmall!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
