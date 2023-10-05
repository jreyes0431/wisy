import 'package:meta/meta.dart';
import 'package:wisy_photo_app/model/photo.dart';

@immutable
class User {
  const User({
    required this.id,
    required this.photos,
  });

  final String id;
  final List<Photo> photos;

  User copyWith({String? id, List<Photo>? photos}) {
    return User(
      id: id ?? this.id,
      photos: photos ?? this.photos,
    );
  }
}
