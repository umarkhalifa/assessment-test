import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';

import '../../../../core/constants/spacing.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: "The greatest\nSound ",
              style: textTheme.displayMedium!.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: MusicAppColors.grey500,
              ),
              children: const [
                TextSpan(
                    text: "to the\n",
                    style: TextStyle(color: MusicAppColors.black)),
                TextSpan(
                    text: "latest hit sound",
                    style: TextStyle(color: MusicAppColors.black)),
              ]),
          textAlign: TextAlign.center,
        ),
        gapH30,
        Row(
          children: [
            const Spacer(),
            Image.asset(
              MusicAppImages.sarz2,
              height: 34.h,
            ),
            gapW20,
            Text(
              "Sarz Happiness",
              style: textTheme.bodySmall!.copyWith(fontSize: 10),
            ),
            const Spacer(),
            Text(
              "0.53",
              style: textTheme.bodySmall!.copyWith(fontSize: 8),
            ),
            gapW5,
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(color: MusicAppColors.black)),
              child: SizedBox(
                height: 25.h,
                width: 25.h,
                child: const Center(
                  child: Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        gapH30,
        Image.asset(
          MusicAppImages.tems,
          height: 253,
        ),
        gapH30,
        gapH20,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Explore Sounds",
              style: textTheme.bodySmall!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            gapW20,
            const Icon(
              Icons.add_circle_outline,
              size: 20,
            )
          ],
        )
      ],
    );
  }
}
