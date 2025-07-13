import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/messaging_util.dart';
import 'package:zembo_agent_app/l10n/l10n.dart';
import 'package:zembo_agent_app/presentation/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    configureSubscribers(context);

    return MaterialApp.router(
      title: 'Zembo Agent',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: FlexThemeData.light(scheme: FlexScheme.dellGenoa),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.dellGenoa),
      routerConfig: goRouter,
    );
  }
}
