import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/app_theme.dart';
import 'package:outtappxperience/core/utils/enums/routes.dart';
import 'package:outtappxperience/core/utils/extension/route.dart';
import 'package:outtappxperience/features/authentication/presentation/screens/onboarding.dart';
import 'package:outtappxperience/features/authentication/presentation/screens/splash.dart';
import 'package:outtappxperience/features/home/presentation/screens/home.dart';
import 'package:outtappxperience/features/home/presentation/screens/music_detail.dart';
import 'package:outtappxperience/features/home/presentation/screens/music_video.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MusicAppTheme.appTheme,
          navigatorKey: navigatorKey,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            MusicRoutes.onBoarding.toRoute(): (context) =>
                const OnBoardingScreen(),
            MusicRoutes.home.toRoute():(context)=> const HomeScreen(),
            MusicRoutes.musicDetail.toRoute():(context)=> const MusicDetailScreen(),
            MusicRoutes.musicVideo.toRoute():(context)=> const MusicVideo(),
          },
        );
      },
      child: const SplashScreen(),
    );
  }
}
