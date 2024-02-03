import 'package:flutter_to_do_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:flutter_to_do_list_provider/app/exception/auth_exception.dart';
import 'package:flutter_to_do_list_provider/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;

  LoginController({
    required UserService userService,
  }) : _userService = userService;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndReserState();
      notifyListeners();
      final user = await _userService.login(email, password);
      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválidos');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
