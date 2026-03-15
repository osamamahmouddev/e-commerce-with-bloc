import 'package:api/dummy_screen.dart';
import 'package:api/on_boarding_screen.dart';
import 'package:api/presentation/bloc/bloc/product_bloc.dart';
import 'package:api/presentation/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          OnBoardingScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) =>
                  DummyScreen(text: 'Home', route: '/product'),
            ),
            GoRoute(
              path: '/product',
              builder: (context, state) => BlocProvider(
                create: (context) => sl<ProductBloc>()..add(GetProduct()),
                child: ProductScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/search",
              builder: (context, state) =>
                  DummyScreen(text: "search", route: null),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) =>
                  DummyScreen(text: "profile", route: null),
            ),
          ],
        ),
      ],
    ),
  ],
);
