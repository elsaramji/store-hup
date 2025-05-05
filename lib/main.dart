// description: Main entry point for the application. Initializes necessary services and runs the app.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/firebase_options.dart';
import 'package:store_hup/fruit_hup_main.dart';
import 'package:store_hup/service/database/presence.dart';
import 'package:store_hup/service/paymet/api_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiPaymentKey.publishablekey;
  //Bloc.observer = BlocObserverImpl();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Preferences.init();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const FruitHup());
}
