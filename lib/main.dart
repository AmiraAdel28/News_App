import 'package:flutter/material.dart';
import 'package:news/modules/home/details/news_details_screen.dart';
import 'package:news/modules/home/home.dart';
import 'package:news/providers/app_provider.dart';
import 'package:news/shard/styles/my_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(child: MyApp(),
  create: (BuildContext context){
    return AppProvider();
  },
  ));
}
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: [
        Locale('en',), // English, no country code
        Locale('ar',), // Spanish, no country code
      ],
      locale: Locale(provider.AppLanguage),

      initialRoute:HomeScreen.routrName ,
      routes: {
     HomeScreen.routrName:(context)=>HomeScreen(),
        NewsDetailsScreen.routeName:(context)=>NewsDetailsScreen()
      },
      theme: MyThemeData.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

