import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/core/widgets/button.dart';
import 'package:outtappxperience/features/authentication/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    final texTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ENTER ONE TIME PASSWORD",
          style: texTheme.bodySmall!
              .copyWith(fontSize: 6, fontWeight: FontWeight.w400),
        ),
        gapH10,
        Text(
          "A One Time Password has been sent to\n0800 000 000",
          style: texTheme.bodySmall!
              .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
        ),
        gapH30,
        gapH20,
        OTPTextField(
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          length: 6,
          // controller: otp2Controller,
          width: MediaQuery.sizeOf(context).width,
          fieldWidth: 46.w,
          style: const TextStyle(fontSize: 17),
          otpFieldStyle: OtpFieldStyle(
            focusBorderColor: MusicAppColors.grey400,
            enabledBorderColor: MusicAppColors.grey400,
          ),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.box,
          // onChanged: model.validateOtp,
        ),
        gapH20,
        Row(
          children: [
            Text(
              "Resend",
              style: texTheme.bodySmall!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: MusicAppColors.blue200),
            ),
            gapW10,
            Image.asset(
              MusicAppImages.undo,
              height: 15,
            ),
            const Spacer(),
            Text(
              "Change phone",
              style: texTheme.bodySmall!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: MusicAppColors.blue200),
            ),
            gapW10,
            Image.asset(
              MusicAppImages.undo,
              height: 15,
            ),
          ],
        ),
        gapH30,
        gapH30,
        Center(
          child: MusicAppButton(
            label: "Validate OTP",
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
