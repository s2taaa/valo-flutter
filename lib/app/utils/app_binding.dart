import 'package:get/get.dart';
import 'package:valo_chat_app/app/data/providers/user_provider.dart';
import 'package:valo_chat_app/app/modules/auth/auth.dart';
import 'package:valo_chat_app/app/modules/home/home.dart';
import 'package:valo_chat_app/app/modules/welcome/welcome.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<AuthController>(AuthController());
    Get.put<WelcomeController>(WelcomeController());
    Get.put<HomeController>(HomeController(provider: Get.put(UserProvider())));
  }
}
