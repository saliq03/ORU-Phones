import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either> fetchProducts(Map<String, dynamic> filters);
  Future<bool> toggleFavorite(String listingId,bool isFav,);
}