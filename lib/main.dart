import 'dart:async';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:nchvbg/src/backend/controllers/data_controller.dart';

import 'app.dart';
import 'src/backend/controllers/app_controller.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded<Future<void>>(
    () async {
      Get.put(AppController());
      Get.put(DataController());
    },
    (error, stack) {},
  );
  runApp(const NchVbgApp());
}
