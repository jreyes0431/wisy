import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wisy_photo_app/ui/views/views.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

final router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: '/take-photo',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const CameraPage(),
      ),
    ),
    GoRoute(
      path: '/edit-photo',
      pageBuilder: (BuildContext context, GoRouterState state) {
        File file = state.extra as File;

        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: EditingPage(file: file),
        );
      },
    ),
  ],
);
