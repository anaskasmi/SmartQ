import 'package:SmartQ/models/Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRepository {
  // 1
  final CollectionReference collection =
      Firestore.instance.collection('services');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // 3
  Future<DocumentReference> addService(Service service) {
    return collection.add(service.toMap());
  }

  // 4
  updateService(Service service) async {
    await collection.document(service.id).updateData(service.toMap());
  }
}
