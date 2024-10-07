import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_manager/core/services/database_service.dart';

class FirestoreServicse implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }
}
