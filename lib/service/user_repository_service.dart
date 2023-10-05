part of service;

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

  Future<void> updateUserCollection({
    required User user,
    required Photo photo,
  }) async {
    DocumentReference newDoc =
        _userCollection.doc(user.id).collection('photos').doc();

    await newDoc.set(<String, dynamic>{
      "id": newDoc.id,
      "url": photo.url,
      "uploadDate": photo.uploadDate.toString(),
      "title": photo.title,
    });
  }
}
