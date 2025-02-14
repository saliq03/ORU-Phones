part of 'home_bloc.dart';

 class HomeState extends Equatable{

  final List<ProductModel> products;
   const HomeState({this.products=const[]});

   HomeState copyWith({List<ProductModel>? products}){
     return HomeState(
       products: products??this.products
     );
   }


  @override
  List<Object?> get props => [products];

 }

