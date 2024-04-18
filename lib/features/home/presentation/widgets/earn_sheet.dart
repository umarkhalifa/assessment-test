import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/features/home/presentation/providers/payment_provider.dart';
import 'package:outtappxperience/features/home/presentation/widgets/account_added.dart';
import 'package:outtappxperience/features/home/presentation/widgets/add_bank_account.dart';
import 'package:outtappxperience/features/home/presentation/widgets/earing_details.dart';
import 'package:provider/provider.dart';

class EarnSheet extends StatelessWidget {
  const EarnSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding:           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

      child: Container(
        height: 600.h,
        decoration: const BoxDecoration(
            color: MusicAppColors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Earn from Streaming",
                    style: textTheme.bodySmall!
                        .copyWith(fontSize: 14, color: MusicAppColors.white),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: MusicAppColors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return earnWidgets[index];
                  },
                  itemCount: earnWidgets.length,
                  controller: Provider.of<PaymentProvider>(context).controller,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


List<Widget> earnWidgets = [const EarnDetails(), const AddBankAccount(), const AccountAdded()];
