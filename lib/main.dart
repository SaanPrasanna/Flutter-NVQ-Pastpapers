import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/viewmodels/pastpapers_model.dart';
import 'locator.dart';
import 'ui/routers.dart';
import 'ui/shared/my_theme_provider.dart';
import 'ui/shared/theme.dart';
import 'ui/widgets/mybehavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  setupLocator();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.sharedPreferences}) : super(key: key);
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PastPapersModel(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              MyThemeModel(sharedPreferences: sharedPreferences),
        ),
      ],
      child: Consumer<MyThemeModel>(
        builder: (context, theme, child) => MaterialApp(
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'NVQ Past Papers',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLisghtTheme ? ThemeMode.light : ThemeMode.dark,
          initialRoute: '/',
          onGenerateRoute: Routers.generateRoute,
        ),
      ),
    );
  }
}
