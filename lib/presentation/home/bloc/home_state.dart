part of 'home_bloc.dart';

 class HomeState extends Equatable{

  final List<ProductModel> products;
  final List<String> favourites;
  final bool isLoggedIn;
   const HomeState({this.products=const[],this.isLoggedIn=false,this.favourites=const[]});

   HomeState copyWith({List<ProductModel>? products,bool? isLoggedIn,List<String>? favourites}){
     return HomeState(
       products: products??this.products,
       isLoggedIn: isLoggedIn??this.isLoggedIn,
       favourites: favourites?? this.favourites
     );
   }


  @override
  List<Object?> get props => [products,isLoggedIn,favourites];

 }

