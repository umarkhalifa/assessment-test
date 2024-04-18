import 'package:flutter/material.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/features/home/presentation/widgets/beat_sheet.dart';
import 'package:outtappxperience/features/home/presentation/widgets/chip_card.dart';
import 'package:outtappxperience/features/home/presentation/widgets/earn_sheet.dart';
import 'package:outtappxperience/features/home/presentation/widgets/music_detail_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MusicAppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Top of the Sound",
          style: textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 17, bottom: 17),
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
              child: Image.asset(
                MusicAppImages.search,
                height: 19,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Top Beats",
                style: textTheme.bodySmall!.copyWith(fontSize: 20),
              ),
            ),
            gapH10,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Discover",
                style: textTheme.bodySmall!
                    .copyWith(fontSize: 14, color: MusicAppColors.grey450),
              ),
            ),
            gapH20,
            SizedBox(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: const [
                  MusicDetailCard(image: MusicAppImages.sarz, label: "Sarz"),
                  gapW15,
                  MusicDetailCard(
                      image: MusicAppImages.jazzy, label: "Don-Jazzy"),
                ],
              ),
            ),
            gapH30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "New Drops",
                    style: textTheme.bodySmall!.copyWith(fontSize: 20),
                  ),
                  gapW5,
                  Text(
                    "December",
                    style: textTheme.bodySmall!
                        .copyWith(fontSize: 14, color: MusicAppColors.grey450),
                  ),
                  const Spacer(),
                  Text(
                    "Feel it",
                    style: textTheme.bodySmall!
                        .copyWith(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            gapH20,
            SizedBox(
              height: 138,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation1, animation2) {
                          return const Align(
                            alignment: (Alignment.bottomRight),
                            child: Material(
                              elevation: 15,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              child: EarnSheet(),
                            ),
                          );
                        },
                        transitionBuilder:
                            (context, animation1, animation2, child) {
                          return SlideTransition(
                            position: Tween(
                              begin: const Offset((1), 0),
                              end: const Offset(0, 0),
                            ).animate(animation1),
                            child: child,
                          );
                        },
                      );
                    },
                    child: Material(
                      color: Colors.white,
                      child: Image.asset(
                        MusicAppImages.pascal,
                        height: 138,
                        width: 140,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return gapW5;
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            gapH30,
            gapH20,
            Row(
              children: [
                const Spacer(),
                Text(
                  "Explore the Caves",
                  style: textTheme.bodySmall!.copyWith(fontSize: 14),
                ),
                const Spacer(),
                Text(
                  "Make Music",
                  style: textTheme.bodySmall!.copyWith(fontSize: 14),
                ),
                const Spacer(),
              ],
            ),
            gapH30,
            gapH10,
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Hero(tag: "chip", child: ChipCard()),
            )
          ],
        ),
      ),
    );
  }
}
