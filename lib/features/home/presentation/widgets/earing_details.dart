import 'package:flutter/material.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/core/widgets/button.dart';

// import 'package:outtappxperience/core/widgets/button.dart';
import 'package:outtappxperience/features/home/presentation/providers/payment_provider.dart';
import 'package:provider/provider.dart';

class EarnDetails extends StatelessWidget {
  const EarnDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const Spacer(),
        Text(
          "0",
          style: textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 128,
              color: MusicAppColors.white),
        ),
        gapH30,
        Text(
          "Earn  While\nYou Stream",
          style: textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 40,
              color: MusicAppColors.white),
          textAlign: TextAlign.center,
        ),
        gapH30,
        MusicAppButton(
          label: "Add Bank account",
          color: MusicAppColors.white,
          backgroundColor: MusicAppColors.black,
          onTap: () {
            Provider.of<PaymentProvider>(context, listen: false).updateStage();
          },
        ),
        const Spacer(),
      ],
    );
  }
}
