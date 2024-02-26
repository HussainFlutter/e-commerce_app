import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:equatable/equatable.dart';

class CartScreenModel extends Equatable{
   final List<ProductsModel> cartModelList;
   const CartScreenModel({this.cartModelList = const <ProductsModel>[]});


   Map productQuantity (List<ProductsModel> cartModelList){
     Map quantity = {};
     for (var element in cartModelList) {
       if(!quantity.containsKey(element))
         {
           quantity[element] = 1;
         }
       else
         {
           quantity[element] += 1;
         }
     }
     return quantity;
   }

   double get subtotal => cartModelList.fold(0, (total, current) => total + current.price);


   double deliveryFee(subtotal){
     if(subtotal >=20) {
       return 0.0;
     } else {
       return 20;
     }
   }
   double totalPrice(subtotal,deliveryFee)
   {
     return subtotal + deliveryFee;
   }
   String freeDelivery(subtotal){
     if(subtotal >= 20)
       {
         return "You Have Free Delivery";
       }
     else
       {
         double missing = subtotal - 20;
         return "Add ${missing.toStringAsFixed(2)} To Have Free Delivery";
       }
   }
   String get subtotalString => subtotal.toStringAsFixed(2);
   String get freeDeliveryString => freeDelivery(subtotal);
   String get totalPriceString => totalPrice(subtotal,deliveryFee(subtotal)).toStringAsFixed(2);
   String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
   @override
  List<Object?> get props => [cartModelList];
}