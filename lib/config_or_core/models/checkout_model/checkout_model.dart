import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../products_model/products_model.dart';

class CheckOutModel extends Equatable {
  final String? address;
  final String? city;
  final String? country;
  final String? email;
  final String? fullName;
  final String? zipCode;
  final List<ProductsModel>? products;
  final double? subTotal;
  final double? deliveryFee;
  final double? total;
  const CheckOutModel({
    required this.products,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.fullName,
    required this.zipCode,
    required this.deliveryFee,
    required this.total,
    required this.subTotal,
  });

  Map<String, Object> toMap() {
    return {
      "address": address!,
      "city":city!,
      "country":country!,
      "email":email!,
      "fullName":fullName!,
      "zipCode":zipCode!,
      "products": products!.map((e) => e.name.toString()).toList(),
      "subtotal": subTotal!,
      "delivery_fee": deliveryFee!,
      "total": total!,
    };
  }

  @override
  List<Object?> get props => [
        address,
        country,
        city,
        email,
        fullName,
        zipCode,
        products,
        subTotal,
        total,
        deliveryFee
      ];
}
