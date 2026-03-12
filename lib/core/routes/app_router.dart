import 'package:api/presentation/bloc/bloc/product_bloc.dart';
import 'package:api/presentation/ui/product_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => sl<ProductBloc>()..add(GetProduct()),
          child: const ProductScreen(),
        );
      },
    ),
  ],
);
