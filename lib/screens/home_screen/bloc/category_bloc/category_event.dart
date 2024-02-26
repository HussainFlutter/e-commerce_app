part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
  @override
  List<Object?> get props => [];
}

class RetrieveCategories extends CategoryEvent {}

class GiveCategoriesToState extends CategoryEvent{
  final List<CategoryModel> categoriesList;
  const GiveCategoriesToState({required this.categoriesList});
  @override
  List<Object?> get props => [categoriesList];
}