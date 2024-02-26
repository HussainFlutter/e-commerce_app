
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/ConfirmedOrdersModels.dart';
import '../../repo/confirmed_order_repo/confirmed_order_repo_impl.dart';

part 'confirmed_orders_event.dart';
part 'confirmed_orders_state.dart';

class ConfirmedOrdersBloc extends Bloc<ConfirmedOrdersEvent, ConfirmedOrdersState> {
  ConfirmedOrdersRepoImpl repo = ConfirmedOrdersRepoImpl();
  ConfirmedOrdersBloc() : super(ConfirmedOrdersLoading()) {
    on<FetchConfirmedList>((event,emit)=> _fetchConfirmedList());
  }
  _fetchConfirmedList(){
    emit(ConfirmedOrdersLoading());
     repo.getProducts().listen((event) {
      // print("EVENTT:"+event.toString());
      emit(ConfirmedOrdersLoaded(list: event));
    });
  }
}
