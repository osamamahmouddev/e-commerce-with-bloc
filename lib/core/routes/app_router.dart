import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../on_boarding_screen.dart';
import '../../presentation/presentation.dart';
import '../core.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: "/product/:productId",
          name: Routes.product,
          builder: (BuildContext context, GoRouterState state) {
            final productId = state.pathParameters["productId"];

            return BlocProvider(
              create: (context) => sl<ProductBloc>(),
              child: const ProductScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
