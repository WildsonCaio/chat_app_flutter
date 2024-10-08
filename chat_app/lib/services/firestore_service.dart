import 'package:chat_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  postFeedback(message) async {
    await db.collection('Feedbacks').add({
      "username": await FirebaseAuthService().checkUser(),
      "profileImage": "",
      "message": message,
      "created_at": DateTime.now()
    });
  }

  getFeedback() async {
    return await db.collection('Feedbacks').orderBy('create_at').snapshots();
    
  }
}
