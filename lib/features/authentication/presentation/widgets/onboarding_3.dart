import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/features/authentication/presentation/providers/auth_provider.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/sign_up_sheet.dart';
import 'package:provider/provider.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Gif(
          height: 98,
          autostart: Autostart.loop,
          fps: 30,
          image: const AssetImage(MusicAppImages.circle),
        ),
        gapH15,
        SizedBox(
          height: 350,
          width: 303,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                top: 0,
                child: Image.asset(
                  MusicAppImages.spotify,
                  height: 233,
                ),
              ),
              Positioned(
                top: 20,
                child: Image.asset(
                  MusicAppImages.event,
                  height: 273,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  MusicAppImages.pascal,
                  height: 303,
                ),
              ),
            ],
          ),
        ),
        gapH30,
        gapH10,
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
                context: context,
                builder: (context) => const SignUpSheet(),
                isScrollControlled: true,
                isDismissible: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                ),
              )
            ).whenComplete(() {
              Provider.of<AuthenticationProvider>(context,listen: false).reset();
            });
          },
          child: Material(
            borderRadius: BorderRadius.circular(35),
            color: MusicAppColors.black,
            child: SizedBox(
              height: 48.h,
              width: 184.w,
              child: Center(
                child: Text(
                  "Signup",
                  style: textTheme.bodySmall!.copyWith(
                      color: MusicAppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
        gapH20,
        Text(
          "Sign in Instead",
          style: textTheme.bodySmall!.copyWith(
              color: MusicAppColors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
