import 'package:get/get.dart';
import 'package:valo_chat_app/app/data/providers/friend_request_provider.dart';
import 'package:valo_chat_app/app/data/providers/profile_provider.dart';
import 'package:valo_chat_app/app/modules/add_friend/add_friend_controller.dart';

class AddFriendBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddFriendController(
          userProvider: ProfileProvider(),
          friendProvider: FriendRequestProvider(),
        ));
  }
}