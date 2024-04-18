import 'package:flutter/material.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/utils/enums/routes.dart';
import 'package:outtappxperience/core/utils/extension/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashLoading();
  }

  /// Splash Loading Time
  Future<void> splashLoading() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    if (mounted) {
      Navigator.pushReplacementNamed(context, MusicRoutes.onBoarding.toRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Music",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 50),
            ),
            const CircleAvatar(
              backgroundColor: MusicAppColors.black,
              radius: 3,
            )
          ],
        ),
      ),
    );
  }
}
