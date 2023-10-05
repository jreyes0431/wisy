import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_photo_app/model/photo.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _userCollection = _firestore.collection('users');

final userRepositoryProvider = Provider((ref) => FirestoreDB());

class FirestoreDB {
  Future<List<Photo>> getUserPhotos({required String id}) async {
    List<Photo> photos = [];
    await _userCollection.doc(id).collection("photos").get().then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (var element in value.docs) {
          photos.add(Photo.fromJson(element.data()));
        }
      },
    );
    return photos;
  }
}
