import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'products_model.g.dart';
@HiveType(typeId:1)
class ProductsModel extends Equatable{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final bool isRecommended;
  @HiveField(5)
  final bool isPopular;
  @HiveField(6)
  final int id;
   const ProductsModel({
     required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular
  });

    Map<String,dynamic> toMap (){
     return {
       "category":category,
       "id":id,
       "imageUrl":imageUrl,
       "isPopular":isPopular,
       "isRecommended":isRecommended,
       "name":name,
       "price":price,
     };
   }

  static ProductsModel fromSnapshot (DocumentSnapshot snap){
    ProductsModel products = ProductsModel(
      id: snap["id"],
      name: snap["name"],
      category: snap["category"],
      imageUrl: snap["imageUrl"],
      price: snap["price"],
      isRecommended: snap["isRecommended"],
      isPopular: snap["isPopular"],
    );
    return products;
  }
  static List<ProductsModel> products = [
    const ProductsModel(
      id: 0,
      name: "Strawberry cocktail",
      category: "Soft Drink",
      imageUrl: "https://images.unsplash.com/photo-1468465236047-6aac20937e92?auto=format&fit=crop&q=80&w=1883&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 6,
      isRecommended: true,
      isPopular: true,
    ),
    const ProductsModel(
      id: 1,
      name: "Lemon juice",
      category: "Soft Drink",
      imageUrl: "https://images.unsplash.com/photo-1459802071246-377c0346da93?auto=format&fit=crop&q=80&w=1795&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 5,
      isRecommended: false,
      isPopular: true,
    ),
    const ProductsModel(
      id: 2,
      name: "Orange juice",
      category: "Soft Drink",
      imageUrl: "https://images.unsplash.com/photo-1508737163554-9c97c28ad0fc?auto=format&fit=crop&q=80&w=1886&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 1,
      isRecommended: true,
      isPopular: false,
    ),
    const ProductsModel(
      id: 3,
      name: "Pepsi",
      category: "Soft Drink",
      imageUrl: "https://images.unsplash.com/photo-1629203851122-3726ecdf080e?auto=format&fit=crop&q=80&w=2129&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 1,
      isRecommended: false,
      isPopular: false,
    ),
    const ProductsModel(
      id: 4,
      name: "Fanta",
      category: "Soft Drink",
      imageUrl: "https://images.unsplash.com/photo-1624517452488-04869289c4ca?auto=format&fit=crop&q=80&w=2003&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 2,
      isRecommended: true,
      isPopular: true,
    ),
    const ProductsModel(
      id: 5,
      name: "Monster Energy Drink",
      category: "Soft Drink",
      imageUrl: "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      price: 3,
      isRecommended: true,
      isPopular: false,
    ),
    const ProductsModel(
      id: 6,
        name: "Strawberry Smoothie",
        category: "Smoothies",
        imageUrl: "https://images.unsplash.com/photo-1570696516188-ade861b84a49?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        price: 2,
        isRecommended: true,
        isPopular: false,
    ),
  ];
  @override
  List<Object?> get props => [name,category,imageUrl,price,isRecommended,isPopular,id];

}