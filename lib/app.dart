import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';
import 'src/frontend/themes/app_theme.dart';

class NchVbgApp extends StatelessWidget {
  const NchVbgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ProjectTheme.light,
      getPages: AppRoutes().pages,
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
