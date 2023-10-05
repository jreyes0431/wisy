part of providers;

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});
