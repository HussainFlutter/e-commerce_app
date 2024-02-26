
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app2/config_or_core/models/category_model/category_model.dart';
import 'package:equatable/equatable.dart';
import '../../../../repository/category_repository/category_repository_implementation.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepositoryImplementation repo;
  CategoryBloc(this.repo) : super(CategoryLoadimg()) {
    on<RetrieveCategories>((event, emit) => _retrieveCategories());
    on<GiveCategoriesToState>((event, emit) => _giveCategoriesToState(event, emit));
  }
  _retrieveCategories (){
    emit(CategoryLoadimg());
     repo.getAllCategories().listen((products) {
       add(GiveCategoriesToState(categoriesList: products));
     });
  }
  _giveCategoriesToState(
      GiveCategoriesToState event,
      Emitter<CategoryState> emit,
      ){
    emit(CategoryLoaded(categoriesList: event.categoriesList));
  }
}
