import 'package:cracked_notes/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../repositories/userdata_repo.dart';

class UserProvider extends StateNotifier<AsyncValue<UserModel>> {
  final UserDataRepo _userDataRepo;

  UserProvider(this._userDataRepo) : super(AsyncValue.loading());

  Future<void> fetchUserData(String username) async {
    state = AsyncValue.loading();

    try {
      UserModel model = await _userDataRepo.callForInfo(username);
      state = AsyncValue.data(model);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

}

final userProvider = StateNotifierProvider<UserProvider, AsyncValue<UserModel>>(
  (ref) {
    return UserProvider(UserDataRepo());
  },
);
