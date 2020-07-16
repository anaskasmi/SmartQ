import 'package:SmartQ/models/Ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TicketRepository {
  // 1
  final CollectionReference collection =
      Firestore.instance.collection('tickets');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // 3
  Future<DocumentReference> addTicket(Ticket ticket) {
    return collection.add(ticket.toMap());
  }

  // 4
  updateTicket(Ticket ticket) async {
    await collection.document(ticket.id).updateData(ticket.toMap());
  }
}
