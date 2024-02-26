part of 'confirmed_orders_bloc.dart';

abstract class ConfirmedOrdersState extends Equatable {
  const ConfirmedOrdersState();
  @override
  List<Object> get props => [];
}

class ConfirmedOrdersLoading extends ConfirmedOrdersState {}
class ConfirmedOrdersLoaded extends ConfirmedOrdersState {
  final List<ConfirmedOrdersModel> list;
  const ConfirmedOrdersLoaded({required this.list});
}
