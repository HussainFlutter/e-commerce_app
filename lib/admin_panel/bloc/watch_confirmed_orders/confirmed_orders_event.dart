part of 'confirmed_orders_bloc.dart';

abstract class ConfirmedOrdersEvent extends Equatable {
  const ConfirmedOrdersEvent();
  @override
  List<Object?> get props => [];
}

class FetchConfirmedList extends ConfirmedOrdersEvent{}