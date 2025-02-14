 import 'package:dartz/dartz.dart';
import 'package:oruphones_assignment/data/sources/api_services.dart';
import 'package:oruphones_assignment/domain/repository/products_repository.dart';
import 'package:oruphones_assignment/service_locator.dart';

class ProductsRepositoryImpl extends ProductsRepository{
  @override
  Future<Either> fetchProducts(Map<String, dynamic> filters) async{
    return await sL<ApiService>().fetchProducts(filters);
  }

}