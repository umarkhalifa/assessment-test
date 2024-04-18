import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/features/home/presentation/providers/payment_provider.dart';
import 'package:provider/provider.dart';

class AccountAdded extends StatelessWidget {
  const AccountAdded({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final value = Provider.of<PaymentProvider>(context);
    return Column(
      children: [
        const Spacer(),
        Hero(
            tag: 'Verified',
            child: Image.asset(MusicAppImages.verified,height: 71,)),
        gapH20,
        Text(
          "Account added",
          style: textTheme.bodySmall!
              .copyWith(fontSize: 14, color: MusicAppColors.white),
        ),
        gapH30,
        gapH30,
        Material(
          color: MusicAppColors.grey900,
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 78.h,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value.account?.accountName ?? '',
                    style: textTheme.bodySmall!
                        .copyWith(fontSize: 12, color: MusicAppColors.white),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(value.account?.accountNumber ?? '',
                          style: textTheme.bodySmall!
                              .copyWith(fontSize: 12, color: MusicAppColors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          value.banks
                                  .where((element) =>
                                      element.id == value.account?.bankId)
                                  .first
                                  .name ??
                              '',style: textTheme.bodySmall!
                            .copyWith(fontSize: 12, color: MusicAppColors.white,
                          overflow: TextOverflow.ellipsis,

                        ),
                        ),
                      ),
                      Image.asset(MusicAppImages.verified,height: 11,),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        const Spacer(),

      ],
    );
  }
}
