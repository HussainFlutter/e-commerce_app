import 'package:bloc/bloc.dart';
import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../repo/add_product/add_product_repo_impl.dart';
import '../../repo/upload_image/upload_image_repo_impl.dart';
part 'add_products_event.dart';
part 'add_products_state.dart';

class AddProductsBloc extends Bloc<AddProductsEvent, AddProductsState> {
  final UploadImageRepoImpl repo;
  final AddProductToFirestoreRepoImpl repo2;
  AddProductsBloc({required this.repo,required this.repo2}) : super(AddProductsInitial()) {
    on<PickImage>((event, emit) => _pickImage(event, emit));
    on<AddProductToFirestore>((event, emit) => _addProductToFirestore(event));
  }
  _pickImage(
      AddProductsEvent event,
      Emitter<AddProductsState> emit,
      )async{
    try{
      emit(UploadingImageLoading());
      ImagePicker picker = ImagePicker();
      XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
      if(imagePicked != null)
      {
        await repo.uploadImage(imagePicked);
        String image = await repo.getImageUrl(imagePicked.name);
        emit(UploadingImageLoaded(imagePath: image));
      }
    }catch(e){
      emit(UploadingImageError());
    }
  }
  _addProductToFirestore(
      AddProductToFirestore event,
      )async{
    await repo2.addProduct(event.productsModel).then((value) {
      debugPrint("AddProductRepo:Success");
    });
  }
}
