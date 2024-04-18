import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/spacing.dart';

class MusicAppButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Color? color;
  final Color? backgroundColor;
  final bool? loading;
  const MusicAppButton({
    super.key, required this.label, this.onTap, this.color, this.backgroundColor, this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 231.w,
        height: 60.h,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors:
            [
              Color(0xff22CEF4),
              Color(0xff164DDC),
              Color(0xff0FDB23),
              Color(0xffBFFF09),
              Color(0xffBFFF09),
            ],begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.circular(40)
        ),
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor??Colors.white,
              borderRadius: BorderRadius.circular(40)
          ),
          child: loading == true?
          Center(
            child: CircularProgressIndicator(
              color: color?? MusicAppColors.black,
            ),
          ):
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,color: color?? MusicAppColors.black
                ),
              ),
              gapW5,
               Icon(Icons.arrow_forward,color: color?? MusicAppColors.black)
            ],
          ),
        ),
      ),
    );
  }
}
