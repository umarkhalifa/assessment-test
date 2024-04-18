import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';

class ChipCard extends StatelessWidget {
  const ChipCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: MusicAppColors.grey100,
      child: SizedBox(
        height: 34.h,
        width: 90.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 9,
              backgroundImage: AssetImage(MusicAppImages.sarz4),
            ),
            gapW5,
            Text(
              "Sarz",
              style: textTheme.bodySmall!
                  .copyWith(fontSize: 14, color: MusicAppColors.grey550),
            ),
            gapW5,
            const Icon(
              Icons.arrow_forward_ios,
              color: MusicAppColors.grey500,
              size: 13,
            )
          ],
        ),
      ),
    );
  }
}
