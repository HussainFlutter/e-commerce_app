import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../config_or_core/models/products_model/products_model.dart';
import '../../../../repository/products_repository/products_repository_implementation.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepositoryImplementation repo;
  ProductsBloc(this.repo) : super(ProductsLoading()) {
    on<RetrieveProducts>((event, emit) => _retrieveProducts());
    on<GiveProductsToState>((event, emit) => _giveProductsToState(event, emit));
    on<SearchProductsEvent>((event, emit) => _search(event));
  }
  _retrieveProducts() {
    repo.getAllProducts().listen((products) {
      add(GiveProductsToState(productsList: products));
    });
  }

  _giveProductsToState(
    GiveProductsToState event,
    Emitter<ProductsState> emit,
  ) {
    emit(ProductsLoading());
    emit(ProductsLoaded(productsList: event.productsList));
  }

  _search(
    SearchProductsEvent event,
  ) async{
    if(event.search == "" || event.search.isEmpty)
      {
        _retrieveProducts();
      }
    else
      {
            final List<ProductsModel> list = (state as ProductsLoaded).productsList.where((e) => e.name
                .toLowerCase()
                .toString()
                .contains(event.search.toLowerCase().toString())).toList();
            emit(ProductsLoaded(productsList: list));
      }
  }
}
