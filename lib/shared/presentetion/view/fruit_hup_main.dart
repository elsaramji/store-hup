part of '../../../main.dart';


class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(
            fontFamily: 'Cairo',
            scaffoldBackgroundColor: AppColors.primaryWhite,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primaryWhite,
              scrolledUnderElevation: 0,
              centerTitle: true,
            ),
          ),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
