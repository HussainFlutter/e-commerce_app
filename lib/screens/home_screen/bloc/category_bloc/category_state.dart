part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoryLoadimg extends CategoryState {}
class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categoriesList;
  const CategoryLoaded({required this.categoriesList});
  @override
  List<Object> get props => [categoriesList];
}