import 'package:flutter_to_do_list_provider/app/modules/auth/login/login.page.dart';
import 'package:flutter_to_do_list_provider/app/modules/auth/login/login_controller.dart';
import 'package:flutter_to_do_list_provider/app/modules/todo_list_module.dart';
import 'package:provider/provider.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(bindings: [
          ChangeNotifierProvider(
            create: (_) => LoginController(),
          ),
        ], routers: {
          '/login': (context) => const LoginPage(),
        });
}
