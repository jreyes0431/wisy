import 'dart:developer';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_photo_app/model/photo.dart';
import 'package:wisy_photo_app/model/user.dart';

import '../service/service.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User(id: '', photos: []));

  final idController = TextEditingController();

  Future<void> updateUserData(WidgetRef ref) async {
    try {
      List<Photo> userPhotos = await ref
          .read(userRepositoryProvider)
          .getUserPhotos(id: idController.text);
      state = state.copyWith(photos: userPhotos, id: idController.text);
    } catch (e) {
      log(e.toString());
    }
  }

  void addPhoto(Photo photo) {
    state = state.copyWith(photos: [...state.photos, photo]);
  }

  Future<void> storagePhoto(WidgetRef ref, File file) async {
    try {
      String downloadUrl =
          await ref.read(userStorageProvider).uploadPhoto(file);
      Photo photo = Photo(
        url: downloadUrl,
        title: '',
        id: '',
        uploadDate: DateTime.now(),
      );
      addPhoto(photo);
      await ref.read(userRepositoryProvider).updateUserCollection(
            user: state,
            photo: photo,
          );
    } catch (e) {
      log(e.toString());
    }
  }
}
