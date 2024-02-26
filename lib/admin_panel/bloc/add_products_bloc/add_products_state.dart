part of 'add_products_bloc.dart';

abstract class AddProductsState extends Equatable {
  const AddProductsState();
  @override
  List<Object> get props => [];
}

class AddProductsInitial extends AddProductsState {}

class UploadingImageLoading extends AddProductsState {}
class UploadingImageLoaded extends AddProductsState {
  final String imagePath;
  const UploadingImageLoaded({required this.imagePath});
  @override
  List<Object> get props => [imagePath];
}
class UploadingImageError extends AddProductsState {}
