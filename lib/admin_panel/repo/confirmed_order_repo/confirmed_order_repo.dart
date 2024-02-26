
import '../../models/ConfirmedOrdersModels.dart';

abstract class ConfirmedOrdersRepo {
  Stream<List<ConfirmedOrdersModel>> getProducts ();
}