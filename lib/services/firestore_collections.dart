import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class CollectionNames {
  CollectionReference appRegistrationsDb = db.collection("appRegistrations");
}

