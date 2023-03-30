import 'package:get/get.dart';
import 'package:getxscrollmixin/models/user_model.dart';
import 'package:getxscrollmixin/repositories/user_repository.dart';

class UserListController extends GetxController
    with StateMixin<List<UserModel>> {
  final UserRepository _userRepository;
  UserListController({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  void onReady() {
    _findUser();
    super.onReady();
  }

  Future<void> _findUser() async {
    final result = await _userRepository.getUsers();

    change(result, status: RxStatus.success());
  }
}
