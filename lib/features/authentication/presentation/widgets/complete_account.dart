import 'package:flutter/material.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/core/widgets/button.dart';
import 'package:outtappxperience/core/widgets/text_field.dart';
import 'package:outtappxperience/features/authentication/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CompleteAccount extends StatelessWidget {
  const CompleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final texTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Setup Account Password",
          style: texTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        gapH20,
        const MusicTextField(
          label: "Password",
          prefixText: "Password",
        ),
        gapH20,
        const MusicTextField(
          label: "Confirm Password",
          prefixText: "Password",
        ),
        const Spacer(),
        Center(
          child: MusicAppButton(
            label: "Complete",
            onTap: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .updateAuthStage();
            },
          ),
        ),
        gapH30,
        gapH10,
      ],
    );
  }
}
