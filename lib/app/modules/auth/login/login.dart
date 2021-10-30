import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'package:valo_chat_app/app/data/providers/user_provider.dart';
import 'package:valo_chat_app/app/modules/auth/auth.dart';
import 'package:valo_chat_app/app/widgets/custom/dialog_loading.dart';
import 'package:valo_chat_app/app/widgets/widgets.dart';
import 'package:valo_chat_app/app/themes/theme.dart';

import '../../../utils/store_service.dart';

part 'login_screen.dart';
part 'login_controller.dart';
