import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/app/app.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/core/utils/enums/routes.dart';
import 'package:outtappxperience/core/utils/extension/route.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/onboarding1.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/onboarding_2.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/onboarding_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 15),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Material(
                      color: MusicAppColors.grey100,
                      borderRadius: BorderRadius.circular(35),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                            navigatorKey.currentState?.pushNamed(
                              MusicRoutes.home.toRoute(),
                            );
                          },
                          child: Text(
                            "Skip",
                            style: textTheme.bodySmall!.copyWith(fontSize: 14,
                            fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Sounds & Beats",
                  style: textTheme.bodySmall!.copyWith(
                      fontSize: 20,
                      color: MusicAppColors.grey500,
                      fontWeight: FontWeight.w600),
                ),
                gapH30,
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return onboarding[index];
                    },
                    itemCount: 3,
                    controller: controller,
                  ),
                ),
                gapH30,
                gapH10,
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: SlideEffect(
                        spacing: 12.w,
                        radius: 10.0,
                        dotWidth: 24.w,
                        dotHeight: 10.h,
                        dotColor: MusicAppColors.grey200,
                        activeDotColor: MusicAppColors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> onboarding = [
  const OnBoarding1(),
  const OnBoarding2(),
  const OnBoarding3(),
];
