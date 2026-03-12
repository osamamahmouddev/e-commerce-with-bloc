import 'package:api/core/network/api_service.dart';
import 'package:api/data/data.dart';
import 'package:api/domin/domin.dart';
import 'package:api/presentation/presentation.dart';
import 'package:get_it/get_it.dart';

import '../core.dart';
import '../network/api_consumer.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  final dio = DioFactory.getDio();
  sl
    ..registerSingleton<ApiConsumer>(ApiService(dio: dio))
    ..registerSingleton(ProductDataSource(apiConsumer: ApiService(dio: dio)))
    
    ..registerLazySingleton<ProductRepo>(
      () => ProductRepoImpl(restClient: sl()),
    )
    ..registerFactory(() => ProductBloc(sl()));
}
