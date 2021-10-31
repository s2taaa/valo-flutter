import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:image_picker/image_picker.dart';
import 'package:valo_chat_app/app/data/providers/user_provider.dart';
import 'package:valo_chat_app/app/utils/store_service.dart';
import 'package:valo_chat_app/app/widgets/custom/dialog_loading.dart';

class TabProfileController extends GetxController {
  //user service
  final UserProvider provider;

  //text field controller
  final TextEditingController inputName = TextEditingController();
  final TextEditingController inputPhone = TextEditingController();
  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputAdress = TextEditingController();

  TabProfileController({required this.provider});

  var isLoading = false.obs;
  //image
  final ImagePicker _picker = ImagePicker();
  var imageURL = '';

  //upload image function
  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile =
          await _picker.pickImage(source: imageSource, imageQuality: 50);
      isLoading(true);
      if (pickedFile != null) {
        var response = await provider.uploadFile(pickedFile.path);
        if (response.ok) {
          //get image url from api response
          imageURL = response.data!.imgUrl;
          print(imageURL);
          Get.snackbar('Success', 'Image uploaded successfully',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        } else if (response.code == HttpStatus.unauthorized) {
          Get.snackbar('Unauthorization', 'token expired');
        } else {
          Get.snackbar('Failed', 'Error Code: ${response}',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      } else {
        Get.snackbar('Failed', 'Image not selected',
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } finally {
      isLoading(false);
    }
  }

  //edit profile infomation function
  void editProfileInfo(
      String name, String phone, String email, String address) async {
    final map = {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address
    };
    // final response =
    try {
      await UserProvider().updateUserInfo(map);
    } on Exception catch (e) {
      // TODO
    }
    // print('Update Response: ${response.toString()}');
    // if (response.code) {
    //   Get.snackbar('update thanh cong', 'yeah');
    // } else {
    //   if (response.code == HttpStatus.forbidden) {
    //     Get.snackbar('fail', 'fdgdfg');
    //   } else if (response.code == HttpStatus.unauthorized) {
    //     Get.snackbar('failed', 'fdsfsd');
    //   } else {
    //     Get.snackbar('failed', 'Sometihing went wrong, try again');
    //   }
    // }
  }

  void back() {
    Get.dialog(const DialogLoading());
    Get.back();
  }

  //log out function
  void logout() {
    Get.dialog(const DialogLoading());
    Storage.logout();
    Get.offAllNamed('/');
  }
}
