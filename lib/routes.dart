import 'package:get/get.dart';

import 'src/frontend/screens/dssr_list_page.dart';
import 'src/frontend/screens/home_page.dart';
import 'src/frontend/screens/vbg_list_page.dart';

class AppRoutes {
  static const String home = "/";
  static const String vbgList = "/vbg";
  static const String dssrList = "/dssr";
  List<GetPage> pages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: vbgList, page: () => const VbgListPage()),
    GetPage(name: dssrList, page: () => const DssrListPage()),
  ];
}
