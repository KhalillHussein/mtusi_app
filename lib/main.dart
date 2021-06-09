import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtusiapp/providers/image_quality.dart';
import 'package:mtusiapp/repositories/news_create.dart';
import 'package:mtusiapp/repositories/notifications.dart';
import 'package:mtusiapp/services/news_create.dart';
import 'package:mtusiapp/services/notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import './repositories/index.dart';
import './services/index.dart';
import './util/index.dart';
import 'providers/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    final bool darkModeOn = prefs.getBool('theme') ?? false;
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemesProvider>(
            create: (_) =>
                ThemesProvider(darkModeOn ? Style.dark : Style.light),
          ),
          ChangeNotifierProvider<NotificationsProvider>(
            create: (_) => NotificationsProvider(),
            lazy: false,
          ),
        ],
        child: App(),
      ),
    );
  });
}

/// Builds the necessary providers, as well as the home page.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final httpClient = Dio();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ValidationProvider()),
        ChangeNotifierProvider(create: (ctx) => NavigationProvider()),
        ChangeNotifierProvider(create: (ctx) => RadioProvider()),
        ChangeNotifierProvider(
          create: (ctx) => TextScaleProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (ctx) => ImageQualityProvider()),
        ChangeNotifierProvider(
          create: (ctx) => AuthRepository(AuthService(httpClient)),
        ),
        ChangeNotifierProxyProvider<AuthRepository, NewsCreateRepository>(
          create: (ctx) => NewsCreateRepository(NewsCreateService(httpClient)),
          update: (ctx, model, model2) =>
              NewsCreateRepository(NewsCreateService(httpClient))
                ..token = model.user.token,
        ),
        ChangeNotifierProxyProvider2<AuthRepository, NotificationsProvider,
            NotificationsRepository>(
          create: (ctx) =>
              NotificationsRepository(NotificationsService(httpClient)),
          update: (ctx, auth, notify, model) =>
              NotificationsRepository(NotificationsService(httpClient))
                ..update(
                  fcmToken: notify.token,
                  userId: auth.user.userId,
                  userToken: auth.user.token,
                ),
        ),
        ChangeNotifierProvider(
            create: (ctx) => LecturersRepository(LecturersService(httpClient))),
        ChangeNotifierProvider(
            create: (ctx) => NewsRepository(NewsService(httpClient))),
        ChangeNotifierProvider(
            create: (ctx) => PhoneBookRepository(PhoneBookService(httpClient))),
        ChangeNotifierProvider(
            create: (ctx) => TimetableRepository(TimetableService(httpClient))),
        ChangeNotifierProxyProvider<TimetableRepository, TableCalendarProvider>(
          create: (ctx) => TableCalendarProvider([]),
          update: (ctx, model, tableCalendar) =>
              TableCalendarProvider(model.getBy(model.userCategory)),
        ),
      ],
      child: Consumer<ThemesProvider>(builder: (ctx, themeData, _) {
        return ThemeProvider(
          initTheme: themeData.getTheme(),
          child: Builder(
            builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate
              ],
              supportedLocales: const [Locale('ru')],
              title: 'MTUСI APP',
              theme: ThemeProvider.of(context),
              darkTheme: Style.dark,
              onGenerateRoute: Routes.generateRoute,
              onUnknownRoute: Routes.errorRoute,
            ),
          ),
        );
      }),
    );
  }
}
