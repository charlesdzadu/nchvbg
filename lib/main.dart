import 'dart:async';

import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'app.dart';
import 'src/backend/controllers/app_controller.dart';

void main(List<String> args) {
  runZonedGuarded<Future<void>>(
    () async {
      Get.put(AppController());
    },
    (error, stack) {},
  );
  runApp(const NchVbgApp());
}
