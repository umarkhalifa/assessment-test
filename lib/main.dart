import 'package:flutter/material.dart';
import 'package:outtappxperience/app/app.dart';
import 'package:outtappxperience/features/authentication/presentation/providers/auth_provider.dart';
import 'package:outtappxperience/features/home/presentation/providers/payment_provider.dart';
import 'package:provider/provider.dart';

import 'config/locator/locator.dart';
void main() async {
  setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
      ],
      child: const MusicApp(),
    ),
  );
}
