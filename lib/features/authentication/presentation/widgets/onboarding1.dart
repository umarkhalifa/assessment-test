import 'package:flutter/material.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text("Explore\nAfrican Beats\n& Sounds",style: textTheme.displayMedium!.copyWith(
          fontSize: 36,fontWeight: FontWeight.w600
        ),textAlign: TextAlign.center,),
        gapH30,
        Image.asset(MusicAppImages.pascal,
        height: 253,
        ),
        gapH30,
        gapH10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: MusicAppColors.grey300,
                  width: 2
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Text("Afro beats",style: textTheme.bodySmall!.copyWith(
                  fontSize: 14,fontWeight: FontWeight.w600
                ),),
              ),
            ),
            gapW10,
            Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: MusicAppColors.grey300,
                      width: 2
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Text("Amapiano",style: textTheme.bodySmall!.copyWith(
                    fontSize: 14,fontWeight: FontWeight.w600
                ),),
              ),
            ),

          ],
        )
      ],
    );
  }
}
