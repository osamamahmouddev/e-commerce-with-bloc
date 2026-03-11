import 'package:api/data/data.dart';
import 'package:api/domin/domin.dart';
import 'package:api/presentation/presentation.dart';
import 'package:get_it/get_it.dart';

import '../core.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  final dio = DioFactory.getDio();
  sl
    ..registerSingleton<ProductDataSource>(ProductDataSource(dio))
    ..registerLazySingleton<ProductRepo>(
      () => ProductRepoImpl(restClient: sl()),
    )
    ..registerFactory(() => ProductBloc(sl()));
}
