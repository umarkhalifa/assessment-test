import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/features/home/presentation/widgets/beat_sheet.dart';

class MusicVideo extends StatefulWidget {
  const MusicVideo({
    super.key,
  });

  @override
  State<MusicVideo> createState() => _MusicVideoState();
}

class _MusicVideoState extends State<MusicVideo> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _widthAnimation = Tween<double>(begin: 0.0, end: 142.w).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                child: Gif(
                  autostart: Autostart.once,
                  fps: 30,
                  image: const AssetImage(MusicAppImages.music),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                top: 20,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: MusicAppColors.white,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 29,
                            width: 29,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: MusicAppColors.white, width: 0.5)),
                            child: const Icon(
                              Icons.more_horiz,
                              color: MusicAppColors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Spacer(),
                      Hero(
                        tag: 'Sarz',
                        child: Text(
                          "Sarz  - Happiness",
                          style: textTheme.bodySmall!.copyWith(
                              fontSize: 32, color: MusicAppColors.white),
                        ),
                      ),
                      gapH30,
                      Hero(
                        tag: 'play',
                        child: Container(
                          height: 10,
                          width: 279.w,
                          decoration: BoxDecoration(
                              color: MusicAppColors.grey400,
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
                                      color: MusicAppColors.white,
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
                              "4:12",
                              style: textTheme.bodySmall!.copyWith(
                                  color: MusicAppColors.white, fontSize: 10),
                            ),
                            const Spacer(),
                            Text(
                              "-2:46",
                              style: textTheme.bodySmall!.copyWith(
                                color: MusicAppColors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      gapH30,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fast_rewind,
                            size: 35,
                            color: MusicAppColors.white,
                          ),
                          gapW30,
                          Icon(
                            Icons.play_arrow,
                            size: 63,
                            color: MusicAppColors.white,
                          ),
                          gapW30,
                          Icon(
                            Icons.fast_forward,
                            size: 35,
                            color: MusicAppColors.white,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              builder: (context) => const BeatsSheet(),
                              isScrollControlled: true,
                              isDismissible: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              MusicAppImages.library2,
                              color: MusicAppColors.white,
                              height: 31,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
