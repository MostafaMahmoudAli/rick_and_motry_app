import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/translations/codegen_loader.g.dart';
import 'config/app_router/app_router.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/service_locator.dart';

Future<void>main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   setUpServiceLocator();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('es'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: MyApp(appRouter: AppRouter()),
    ),
  );

}

class MyApp extends StatelessWidget {
   const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? _)
      {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: themeData(),
           onGenerateRoute: appRouter.onGenerateRoute,
        );
      },
    );
  }
}


