part of service;

final Reference _storageRef = FirebaseStorage.instance.ref();

final userStorageProvider = Provider((ref) => FbStorage());

class FbStorage {
  Future<String> uploadPhoto(File file) async {
    String downloadUrl = '';
    try {
      final Reference storageReference = _storageRef
          .child("photos")
          .child("photo${file.path.split("/").last}");
      UploadTask uploadTask = storageReference.putFile(file);
      downloadUrl = await (await uploadTask).ref.getDownloadURL();
    } on FirebaseException catch (e) {
      log(e.toString());
    }

    return downloadUrl;
  }
}
