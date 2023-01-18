import 'package:flutter/services.dart' show rootBundle;

import 'package:get/get.dart';

class DataController extends GetxController {
  Future<String> getVbgGenralInformation() async {
    var content =
        await rootBundle.loadString('assets/data/vbg/general_information.md');

    return content;
  }

  Future<String> getViolenceData(String slug) async {
    var content = await rootBundle.loadString('assets/data/vbg/$slug.md');

    return content;
  }

  Future<String> getDssrData(String slug) async {
    var content = await rootBundle.loadString('assets/data/dssr/$slug.md');

    return content;
  }

  Future<String> getVbgLawData(String slug) async {
    var content = await rootBundle.loadString('assets/data/vbg/lois/$slug.md');
    return content;
  }
}
