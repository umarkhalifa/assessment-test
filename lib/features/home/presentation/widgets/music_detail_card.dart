import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/app/app.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/utils/enums/routes.dart';
import 'package:outtappxperience/core/utils/extension/route.dart';

class MusicDetailCard extends StatelessWidget {
  final String image;
  final String label;

  const MusicDetailCard({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        navigatorKey.currentState?.pushNamed(
          MusicRoutes.musicDetail.toRoute(),
        );
      },
      child: Container(
        height: 253.h,
        width: 256.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.darken,
            ),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                label,
                style: textTheme.bodySmall!
                    .copyWith(fontSize: 36, color: MusicAppColors.white),
              ),
            ),
            const Spacer(),
            Text(
              "Rymes & Rythem",
              style: textTheme.bodySmall!
                  .copyWith(fontSize: 20, color: MusicAppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
