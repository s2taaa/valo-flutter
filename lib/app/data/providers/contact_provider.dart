import 'package:dio/dio.dart';
import 'package:valo_chat_app/app/data/connect_service.dart';
import 'package:valo_chat_app/app/data/models/contact_model.dart';
import 'package:valo_chat_app/app/data/models/network_response.dart';
import 'package:valo_chat_app/app/utils/storage_service.dart';

class ContactProvider {
  //end point
  static const String getFriendsUrl = '/friends';

  //Get frineds
  Future<NetworkResponse<ContactPage>> getFriends(int page) async {
    try {
      final response = await ConnectService().get(
        getFriendsUrl,
        params: {'page': page},
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => ContactPage.fromJson(json),
      );
    } on DioError catch (e, s) {
      throw Exception("$e///////////$s");
    }
  }

}
