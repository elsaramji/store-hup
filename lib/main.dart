// description: Main entry point for the application. Initializes necessary services and runs the app.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/helper/go_routs.dart';
import 'core/injection/Git_it.dart';
import 'core/styles/color_style.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'service/database/presence.dart';
import 'service/paymet/api_keys.dart';
import 'service/state_management/BlocObservers/bloc_observers.dart';

part 'shared/presentetion/view/fruit_hup_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiPaymentKey.publishablekey;
  Bloc.observer = BlocObserverImpl();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Preferences.init();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const FruitHup());
}
