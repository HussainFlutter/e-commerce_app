part of 'wish_list_bloc.dart';

abstract class WishListState extends Equatable {
  const WishListState();
  @override
  List<Object> get props => [];
}

class WishListInitial extends WishListState {}
//Wishlist
class WishListLoadingState extends WishListState{}
class WishListLoadedState extends WishListState{
    final WishListModel wishlistProducts;
    const WishListLoadedState({this.wishlistProducts = const WishListModel(),});
   @override
   List<Object> get props => [wishlistProducts];
}
class WishListLoadingError extends WishListState{}
class DeletedItemState extends WishListState{}
class WishListGotEmptyState extends WishListState{}
//Wishlist
//Wishlist add product

//Wishlist add product