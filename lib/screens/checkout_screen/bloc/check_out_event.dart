part of 'check_out_bloc.dart';

abstract class CheckOutEvent extends Equatable {
  const CheckOutEvent();
  @override
  List<Object?> get props => [];
}

class UpdateCheckOutEvent extends CheckOutEvent {
  final String? address;
  final String? city;
  final String? country;
  final String? email;
  final String? fullName;
  final String? zipCode;
  final CartScreenModel? model;
  const UpdateCheckOutEvent({
    this.model,
    this.email,
    this.address,
    this.city,
    this.country,
    this.fullName,
    this.zipCode,
  });
  @override
  List<Object?> get props =>
      [
        address,
        city,
        country,
        email,
        fullName,
        zipCode,
         model];
}

class ConfirmCheckoutEvent extends CheckOutEvent {
  final CheckOutModel checkOutModel;
  const ConfirmCheckoutEvent({required this.checkOutModel});
  @override
  List<Object> get props => [checkOutModel];
}
