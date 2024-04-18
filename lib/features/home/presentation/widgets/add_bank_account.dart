import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outtappxperience/config/theme/app_theme/music_colors.dart';
import 'package:outtappxperience/core/constants/images.dart';
import 'package:outtappxperience/core/constants/spacing.dart';
import 'package:outtappxperience/core/enum/app_state.dart';
import 'package:outtappxperience/core/widgets/button.dart';
import 'package:outtappxperience/features/home/presentation/providers/payment_provider.dart';
import 'package:provider/provider.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({super.key});

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  late final TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PaymentProvider>(context, listen: false).getBanks();
    });
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final value = Provider.of<PaymentProvider>(context);
    if (value.appState == AppState.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: MusicAppColors.white,
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          DropdownButtonFormField(
            items: value.banks.map((bank) {
              return DropdownMenuItem(
                value: bank,
                child: Text(
                  bank.name ?? '',
                  style: textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      color: MusicAppColors.white,
                      overflow: TextOverflow.ellipsis),
                ),
              );
            }).toList(),
            dropdownColor: MusicAppColors.black,
            isExpanded: true,
            onChanged: (item) {
              value.changeBank(item!);
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                hintText: 'Select Bank',
                hintStyle: textTheme.bodySmall!
                    .copyWith(color: MusicAppColors.white, fontSize: 12),
                constraints: BoxConstraints(maxHeight: 60.h)),
          ),
          gapH20,
          TextFormField(
            cursorColor: MusicAppColors.white,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.white),
              ),
              hintText: 'Account Number',
              hintStyle: textTheme.bodySmall!
                  .copyWith(color: MusicAppColors.white, fontSize: 12),
              constraints: BoxConstraints(maxHeight: 60.h),
            ),
            controller: controller,
            keyboardType: TextInputType.number,
            style: textTheme.bodySmall!
                .copyWith(color: MusicAppColors.white, fontSize: 12),
          ),
          gapH10,
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Row(
              children: [
                Hero(
                  tag: 'Verified',
                  child: Image.asset(
                    MusicAppImages.verified,
                    height: 13,
                  ),
                ),
                gapW10,
                Text(
                  value.account?.accountName ?? '',
                  style: textTheme.bodySmall!
                      .copyWith(color: MusicAppColors.white, fontSize: 14),
                )
              ],
            ),
          ),
          const Spacer(),
          const Spacer(),
          MusicAppButton(
            label: value.account == null ? "Verify Account" : "Add Account",
            color: MusicAppColors.white,
            backgroundColor: MusicAppColors.black,
            loading: value.appState == AppState.inAppLoading,
            onTap: () {
              value.verifyAccount(number: controller.text.trim());
            },
          ),
          gapH30,
          gapH30,
        ],
      );
    }
  }
}
