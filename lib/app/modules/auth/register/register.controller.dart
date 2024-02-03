import 'package:flutter_to_do_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:flutter_to_do_list_provider/app/exception/auth_exception.dart';
import 'package:flutter_to_do_list_provider/app/services/user/user_service.dart';

class RegisterController extends DefaultChangeNotifier {
  final UserService _userService;
  RegisterController({
    required UserService userService,
  }) : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndReserState();
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        //sucesso
        success();
      } else {
        //erro
        setError(error);
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
