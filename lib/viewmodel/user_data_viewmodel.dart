import 'package:cracked_notes/repositories/user_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserViewModel extends StateNotifier<AsyncValue<bool>> {
  final UserAuthRepository _repo;

  UserViewModel(this._repo) : super(AsyncValue.loading());

  Future<void> signupBackend(String email, String password) async {
    state = AsyncValue.loading();

    try {
      final val = await _repo.userSignup(email, password);

      if (val) {
        state = AsyncValue.data(true);
      } else {
        state = AsyncValue.data(false);
      }

    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final userAuthProvider = StateNotifierProvider<UserViewModel, AsyncValue<bool>>((ref){

  return UserViewModel(UserAuthRepository());

});
