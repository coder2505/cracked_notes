import 'package:cracked_notes/viewmodel/ui_stateproviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../repositories/userdata_repo.dart';

class UserBasicinfoViewmodel extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final UserDataRepo _userDataRepo;
  final Ref ref;

  UserBasicinfoViewmodel(this._userDataRepo, this.ref) : super(AsyncValue.loading());
  Map<String, dynamic> data = {};

  Future<void> fetchBasicUserData(String username) async {
    state = AsyncValue.loading();

    try {
      data = await _userDataRepo.basicInfo(username);
      if(! data.containsKey("errors")){

        ref.read(foundUser.notifier).state = true;

      }
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

}

final userBasicInfoProvider = StateNotifierProvider<UserBasicinfoViewmodel, AsyncValue<Map<String, dynamic>>>(
      (ref) {
    return UserBasicinfoViewmodel(UserDataRepo(), ref);
  },
);
