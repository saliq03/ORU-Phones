import 'package:dartz/dartz.dart';
import 'package:oruphones_assignment/domain/repository/products_repository.dart';
import 'package:oruphones_assignment/domain/usecases/usecase.dart';

import '../../../service_locator.dart';

class FetchProductsUseCase implements UseCase<Either,Map<String, dynamic> >{
  @override
  Future<Either> call({Map<String, dynamic>? params}) async{
    return await sL<ProductsRepository>().fetchProducts(params!);
  }

}