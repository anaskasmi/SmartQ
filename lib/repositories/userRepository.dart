import 'package:SmartQ/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  // 1
  final CollectionReference collection = Firestore.instance.collection('users');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // 3
  Future<DocumentReference> addUser(User user) {
    return collection.add(user.toMap());
  }

  // 4
  updateUser(User user) async {
    await collection.document(user.id).updateData(user.toMap());
  }
}
