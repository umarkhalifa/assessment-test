import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/app/app.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/utils/enums/routes.dart';
import 'package:outtappxperience/core/utils/extension/route.dart';
import 'package:outtappxperience/features/home/presentation/widgets/chip_card.dart';

import '../../../../core/constants/spacing.dart';

class MusicDetailScreen extends StatefulWidget {
  const MusicDetailScreen({super.key});

  @override
  State<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends State<MusicDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _widthAnimation = Tween<double>(begin: 0.0, end: 58.w).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MusicAppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Hero(
          tag: 'Sarz',
          child: Text(
            "Sarz  - Happiness",
            style: textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Container(
              height: 29,
              width: 29,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: MusicAppColors.black, width: 0.5)),
              child: const Icon(
                Icons.more_horiz,
                color: MusicAppColors.black,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Hero(tag: "chip", child: ChipCard()),
            gapH15,
            Image.asset(
              MusicAppImages.sarz3,
              height: 340.h,
            ),
            gapH30,
            Hero(
              tag: 'play',
              child: Container(
                height: 10,
                width: 279.w,
                decoration: BoxDecoration(
                    color: MusicAppColors.grey100,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    AnimatedBuilder(
                      animation: _widthAnimation,
                      builder: (context, child) {
                        return Container(
                          height: 10,
                          width: _widthAnimation.value,
                          decoration: const BoxDecoration(
                            color: MusicAppColors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            gapH5,
            SizedBox(
              width: 279.w,
              child: Row(
                children: [
                  Text(
                    "3:23",
                    style: textTheme.bodySmall!.copyWith(fontSize: 10),
                  ),
                  const Spacer(),
                  Text(
                    "-0:23",
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            gapH30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.fast_rewind,
                  size: 35,
                ),
                gapW30,
                GestureDetector(
                  onTap: () {
                    navigatorKey.currentState?.pushNamed(
                      MusicRoutes.musicVideo.toRoute(),
                    );
                  },
                  child: const Icon(
                    Icons.play_arrow,
                    size: 63,
                  ),
                ),
                gapW30,
                const Icon(
                  Icons.fast_forward,
                  size: 35,
                )
              ],
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
