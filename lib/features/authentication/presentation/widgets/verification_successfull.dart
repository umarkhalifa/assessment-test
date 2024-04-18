import 'package:flutter/material.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/features/authentication/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
class VerificationSuccessful extends StatefulWidget {
  const VerificationSuccessful({super.key});

  @override
  State<VerificationSuccessful> createState() => _VerificationSuccessfulState();
}

class _VerificationSuccessfulState extends State<VerificationSuccessful> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateStage();
  }

  Future<void> updateStage() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (mounted) {
      Provider.of<AuthenticationProvider>(context, listen: false)
          .updateAuthStage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          MusicAppImages.check,
          height: 138,
        ),
        Text(
          "Phone Number verified",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}