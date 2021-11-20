import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';

import 'package:boilerplate/ui/auth/login/forgot_password.dart';
import 'package:boilerplate/ui/auth/login/login.dart';
import 'package:boilerplate/ui/auth/login/sign_up.dart';
import 'package:boilerplate/ui/app/main.dart';
import 'package:boilerplate/ui/note/all_note.dart';
import 'package:boilerplate/ui/note/today_note.dart';
import 'package:boilerplate/ui/note/upcoming_note.dart';
import 'package:boilerplate/ui/note/search.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String forgotPassword = '/forgotPassword';
  static const String signUp = '/signUp';
  static const String main = '/main';
  static const String allNote = '/allNote';
  static const String todayNote = '/todayNote';
  static const String upcomingNote = '/upcomingNote';
  static const String search = '/search';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    forgotPassword: (BuildContext context) => ForgotPasswordScreen(),
    signUp: (BuildContext context) => SignUpScreen(),
    main: (BuildContext context) => MainScreen(),
    allNote: (BuildContext context) => AllNoteScreen(),
    todayNote: (BuildContext context) => TodayNoteScreen(),
    upcomingNote: (BuildContext context) => UpcomingNoteScreen(),
    search: (BuildContext context) => SearchNoteScreen(),
  };
}
