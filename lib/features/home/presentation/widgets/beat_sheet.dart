import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';

class BeatsSheet extends StatelessWidget {
  const BeatsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 679.h, minHeight: 679.h),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    constraints: BoxConstraints(maxHeight: 39.h),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: MusicAppColors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: MusicAppColors.black),
                    ),
                    contentPadding: const EdgeInsets.only(left: 15, right: 15),
                    hintText: "Name or sound type",
                    hintStyle: textTheme.bodySmall!.copyWith(fontSize: 12.sp),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset(MusicAppImages.search),
                    ),
                    suffixIconConstraints: const BoxConstraints(maxHeight: 19)),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Top Beats",
                    style: textTheme.bodySmall!.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Image.asset(
                    MusicAppImages.library,
                    height: 100,
                  ),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
