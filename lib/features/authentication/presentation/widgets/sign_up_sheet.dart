import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/features/authentication/presentation/providers/auth_provider.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/complete_account.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/verification_successfull.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/verify_code.dart';
import 'package:outtappxperience/features/authentication/presentation/widgets/verify_phone.dart';
import 'package:provider/provider.dart';

List<Widget> authProcess = [
  const VerificationPhone(),
  const VerificationCode(),
  const VerificationSuccessful(),
  const CompleteAccount()
];

class SignUpSheet extends StatelessWidget {
  const SignUpSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 600.h, maxHeight: 600.h),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    authProvider.authStage == 2
                        ? "Complete Account"
                        : "Signup with phone",
                    style: textTheme.bodySmall!.copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: MusicAppColors.grey300,
                    ),
                  ),
                ],
              ),
              gapH30,
              gapH30,
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return authProcess[index];
                  },
                  itemCount: authProcess.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: authProvider.controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
