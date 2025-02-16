part of 'home_bloc.dart';

class HomeEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
class FetchProducts extends HomeEvent{}
class FetchUser extends HomeEvent{}
class AddOrRemoveFromFavourites extends HomeEvent{
 final  String id;
  AddOrRemoveFromFavourites({required this.id});
 @override
 List<Object?> get props => [];
}
