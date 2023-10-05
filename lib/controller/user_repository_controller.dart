import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_photo_app/model/photo.dart';
import 'package:wisy_photo_app/model/user.dart';
import 'package:wisy_photo_app/service/user_repository_service.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User(id: '', photos: []));

  final idController = TextEditingController();

  Future<void> updateUserData(WidgetRef ref) async {
    try {
      List<Photo> userPhotos = await ref
          .read(userRepositoryProvider)
          .getUserPhotos(id: idController.text);
      state = state.copyWith(photos: userPhotos);
    } catch (e) {
      log(e.toString());
    }
  }

  void addPhoto(Photo photo) {
    state = state.copyWith(photos: [...state.photos, photo]);
  }
}
