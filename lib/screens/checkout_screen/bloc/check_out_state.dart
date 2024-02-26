part of 'check_out_bloc.dart';

abstract class CheckOutState extends Equatable {
  const CheckOutState();
  @override
  List<Object?> get props => [];
}

class CheckOutLoading extends CheckOutState {}

class CheckOutLoaded extends CheckOutState {
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
  final CheckOutModel model;
  CheckOutLoaded({
    this.products,
     this.email,
    this.address,
    this.city,
    this.country,
    this.fullName,
    this.zipCode,
    this.deliveryFee,
    this.total,
    this.subTotal,
  }) : model = CheckOutModel(
          products: products,
          email: email,
          address: address,
          city: city,
          country: country,
          fullName: fullName,
          zipCode: zipCode,
          deliveryFee: deliveryFee,
          total: total,
          subTotal: subTotal,
        );
  @override
  List<Object?> get props => [
        address,
        city,
        country,
        email,
        fullName,
        zipCode,
        products,
        subTotal,
        deliveryFee,
        total,
        model
      ];
}
