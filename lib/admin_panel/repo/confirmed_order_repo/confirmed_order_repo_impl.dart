
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/admin_panel/repo/confirmed_order_repo/confirmed_order_repo.dart';
import '../../models/ConfirmedOrdersModels.dart';

class ConfirmedOrdersRepoImpl extends ConfirmedOrdersRepo{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Stream<List<ConfirmedOrdersModel>> getProducts(){
    return firestore.collection("checkout").snapshots().map((event) {
        return event.docs.map((e) =>  ConfirmedOrdersModel.fromSnapShot(e)).toList();
    });
  }
}