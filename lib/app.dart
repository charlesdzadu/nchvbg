import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

class NchVbgApp extends StatelessWidget {
  const NchVbgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes().pages,
      home: const LoadingStateWidget(),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
