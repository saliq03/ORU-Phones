import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oruphones_assignment/data/sources/api_services.dart';
import 'package:oruphones_assignment/data/sources/user_prefrences/user_prefrences.dart';
import 'package:oruphones_assignment/domain/repository/products_repository.dart';

import 'package:oruphones_assignment/domain/usecases/products/fetch_products.dart';

import '../../../data/models/product.dart';
import '../../../service_locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserPreferences userPreferences=UserPreferences();
  HomeBloc() : super(HomeState()){
    on<FetchProducts>(_fetchProducts);
    on<FetchUser>(_fetchUser);
    on<AddOrRemoveFromFavourites>(_addOrRemoveFavourite);
  }
Future<void> _fetchProducts(FetchProducts event,Emitter<HomeState> emit) async {
    print("fetchProductsmethod called");
  Map<String, dynamic> filters = {
    "filter": {
      "condition": ["Like New", "Fair","Good",],
      // "make": ["Samsung"],
      "storage": ["16 GB", "32 GB","64 GB","128 GB","256 GB","512 GB"],
      // "ram": ["4 GB"],
      // "warranty": ["Brand Warranty", "Seller Warranty"],
      // "priceRange": [40000, 175000],
      // "verified": true,
      // "sort": {}, // Add sorting logic if needed
      // "page": 1,
    },
  };
    var result=await sL<FetchProductsUseCase>().call(params: filters);
    result.fold((l){

    }, (r){
      emit(state.copyWith(products: r));
    });


}
 void _fetchUser(FetchUser event,Emitter<HomeState> emit)async{
    bool isLogin=await userPreferences.isLogin();

    emit(state.copyWith(isLoggedIn: isLogin));
  }

  void _addOrRemoveFavourite(AddOrRemoveFromFavourites event ,Emitter<HomeState> emit)async{
    List<String> fav=List.from(state.favourites);
    if(fav.contains(event.id)){
      fav.remove(event.id);
      await sL<ProductsRepository>().toggleFavorite(event.id, false);
    }
    else{
      fav.add(event.id);
      await sL<ProductsRepository>().toggleFavorite(event.id, true);
    }

    emit(state.copyWith(favourites: fav));
  }
}
