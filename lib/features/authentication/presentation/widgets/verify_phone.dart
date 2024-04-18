import 'package:flutter/material.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/core/widgets/button.dart';
import 'package:outtappxperience/core/widgets/text_field.dart';
import 'package:outtappxperience/features/authentication/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class VerificationPhone extends StatelessWidget {
  const VerificationPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        gapH30,
        const MusicTextField(
          label: "PHONE NUMBER",
          prefixText: '+234',
        ),
        gapH10,
        Text(
          "an OTP would sent to phone number",
          style: textTheme.bodySmall!
              .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
        ),
        gapH30,
        gapH30,
        Center(
          child: MusicAppButton(
            label: "Verify phone",
            onTap: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .updateAuthStage();
            },
          ),
        ),
      ],
    );
  }
}
