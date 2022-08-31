import 'package:flutter/services.dart';

import 'presentation/routes/route_names.dart';
import 'presentation/routes/routes.dart';
import 'package:flutter/material.dart';

import 'configurations/front_end.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: FrontEndConfigs.kWhiteColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 1,
          iconTheme: IconThemeData(color: FrontEndConfigs.kBlackColor),
          backgroundColor: FrontEndConfigs.kWhiteColor,
          centerTitle: true,
        ),
        colorScheme: const ColorScheme.light()
            .copyWith(primary: FrontEndConfigs.kPrimaryColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteNames.splashViewRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
