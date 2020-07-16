import 'package:SmartQ/models/Agency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgencyRepository {
  // 1
  final CollectionReference collection =
      Firestore.instance.collection('agencies');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // 3
  Future<DocumentReference> addAgency(Agency agency) {
    return collection.add(agency.toMap());
  }

  // 4
  updateAgency(Agency agency) async {
    await collection.document(agency.id).updateData(agency.toMap());
  }
}
