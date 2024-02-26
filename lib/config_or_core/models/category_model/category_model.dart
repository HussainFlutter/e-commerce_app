
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable{
  final String name;
  final String image;
  const CategoryModel({required this.name,required this.image});
  static CategoryModel fromSnapshot(DocumentSnapshot snap){
    CategoryModel category = CategoryModel(name: snap["name"], image: snap["imageUrl"]);
    return category;
  }
  static List<CategoryModel> categories = [
    const CategoryModel(
        name: "Soft Drink",
        image: "https://plus.unsplash.com/premium_photo-1676300547280-10480933ee50?auto=format&fit=crop&q=80&w=2127&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ),
    const CategoryModel(
        name: "Smoothies",
        image: "https://images.unsplash.com/photo-1505252585461-04db1eb84625?auto=format&fit=crop&q=80&w=1908&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ),
    const CategoryModel(
        name: "Water",
        image: "https://images.unsplash.com/photo-1587310972467-27a5c504bfb1?auto=format&fit=crop&q=80&w=1923&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [name,image];
}