import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:zembo_agent_app/core/utils/messaging_util.dart';
import 'package:zembo_agent_app/l10n/l10n.dart';
import 'package:zembo_agent_app/presentation/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    configureSubscribers(context);

    return OKToast(
      child: MaterialApp.router(
        title: 'Zembo Agent',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        themeMode: ThemeMode.light,
        theme: FlexThemeData.light(
          scheme: FlexScheme.dellGenoa,
          fontFamily: 'Gilroy',
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.dellGenoa,
          fontFamily: 'Gilroy',
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
