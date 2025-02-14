import 'package:get_it/get_it.dart';
import 'package:oruphones_assignment/data/repository/products.dart';
import 'package:oruphones_assignment/data/sources/api_services.dart';
import 'package:oruphones_assignment/domain/repository/products_repository.dart';
import 'package:oruphones_assignment/domain/usecases/products/fetch_products.dart';

final sL=GetIt.instance;

Future<void> initializeDependencies()async {

  sL.registerSingleton<ApiService>(ApiServiceImpl());
  sL.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  sL.registerSingleton<FetchProductsUseCase>(FetchProductsUseCase());
}
