import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentorship_week_two/Utilites/theme_helper.dart';
import '../Modules/Details/details_screen.dart';
import '../Modules/Global/global_screen.dart';
import '../Modules/Home/home_screen.dart';
import '../Modules/Search/search_screen.dart';
import '../Modules/Settings/settings_screen.dart';

BuildContext? get currentContext_ => GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;
class GoRouterConfig{
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        //name: HomeScreen.routeName,
        path: "/",
       // "/${HomeScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: buildScreenWithGradient( const HomeScreen()),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
       name: DetailsScreen.routeName,
        path: "/${DetailsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const DetailsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: SearchScreen.routeName,
        path: "/${SearchScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SearchScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: GlobalScreen.routeName,
        path: "/${GlobalScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const GlobalScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: SettingsScreen.routeName,
        path: "/${SettingsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: buildScreenWithGradient( const SettingsScreen()),
          );
        },
        routes: const <RouteBase>[],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   if(!SharedPref.isLogin()) return LoginScreen.routeName;
    //   if(state.matchedLocation == LoginScreen.routeName && SharedPref.isLogin()) return "/${HomeScreen.routeName}";
    //
    //   if(state.matchedLocation == OtpScreen.routeName && state.extra == null){
    //     return ForgotPasswordScreen.routeName;
    //   }
    // },
  );
  static Widget buildScreenWithGradient(Widget child) {
    return Scaffold(
      // Setting the gradient as the background
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors:ThemeClass.backgroundGradiant,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
  static CustomTransitionPage getCustomTransitionPage({required GoRouterState state, required Widget child}){
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}





