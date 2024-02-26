import 'package:bloc/bloc.dart';
import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../repository/wishlist_repository/wishlist_repo_impl.dart';
part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishlistRepoImpl repo;
  WishListBloc(this.repo) : super(const WishListLoadedState()) {
    on<AddProductToWishListEvent>((event,emit)=> _addProductToWishlist(event,emit));
    on<StartProductWishListEvent>((event,emit)=> fa());
    on<DeleteProductToWishListEvent>((event, emit) => _deleteProduct(event, emit));
  }
  _deleteProduct(
      DeleteProductToWishListEvent event,
      Emitter<WishListState>emitter,
      )async{
    if (state is WishListLoadedState)
      {
        Box box = await repo.openBox();
        repo.removeFromBox(box, event.product);
        emit(WishListLoadedState(wishlistProducts:WishListModel(products: await repo.getBox(box))));
      }
  }
   fa()async{
     Box box = await repo.openBox();
    emit(WishListLoadedState(wishlistProducts:WishListModel(products: await repo.getBox(box))));
  }

  void _addProductToWishlist(
      AddProductToWishListEvent event,
      Emitter<WishListState>emitter,
      )async{
    try{
      Box box = await repo.openBox();
      await repo.addToBox(box, event.product);
      emit(WishListLoadedState(wishlistProducts:WishListModel(products: await repo.getBox(box))));
    }catch(e){
      emit(WishListLoadingError());
    }
  }
}
