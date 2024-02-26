import 'package:cloud_firestore/cloud_firestore.dart';

class ConfirmedOrdersModel {
  final List<dynamic> products;
  final String email;
  final String address;
  final String city;
  final String country;
  final String fullName;
  final double deliveryFee;
  final double total;
  final double subTotal;
  final String zipCode;
  ConfirmedOrdersModel({
      required this.products,
      required this.email,
      required this.address,
      required this.city,
      required this.country,
      required this.fullName,
      required this.deliveryFee,
      required this.total,
      required this.subTotal,
      required this.zipCode,
      });
  static ConfirmedOrdersModel fromSnapShot(DocumentSnapshot snap) {
    // List<String> productsList = [];
    // // Check if the "products" field is a List<dynamic>
    //   productsList = (snap["products"] as List<dynamic>).map((item) => item.toString()).toList();
    print(snap["address"]);
    print(snap["city"]);
    print(snap["country"]);
    print(snap["delivery_fee"]);
    print(snap["email"]);
    print(snap["fullName"]);
    print(snap["products"]);
    print(snap["subtotal"]);
    print(snap["total"]);
    print(snap["zipCode"]);
    return ConfirmedOrdersModel(
        address: snap["address"],
        city: snap["city"],
        country: snap["country"],
        deliveryFee: snap["delivery_fee"],
        email: snap["email"],
        fullName: snap["fullName"],
        products: snap["products"],
        subTotal: snap["subtotal"],
        total: snap["total"],
        zipCode: snap["zipCode"],
    );
  }
}
