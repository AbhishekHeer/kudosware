import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static Future<void> get() async {
    final db = FirebaseFirestore.instance;
  }
}
