import 'package:get/get.dart';

import 'src/frontend/screens/home_page.dart';

class AppRoutes {
  static const String home = "/";
  List<GetPage> pages = [
    GetPage(name: home, page: () => const HomePage()),
  ];
}
