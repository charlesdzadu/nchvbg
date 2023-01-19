import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:get/get.dart';
import 'package:nchvbg/src/backend/models/useful_contact.dart';

class DataController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getDssrUsefulContacts();
    getVbgUsefulContacts();
  }

  RxList<UsefulContact> dssrContacts = <UsefulContact>[].obs;
  RxList<UsefulContact> vbgContacts = <UsefulContact>[].obs;

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

  Future getDssrUsefulContacts() async {
    List<dynamic> jsonData = await parseJsonFromAssets(
      "assets/data/dssr/centers_dssr_data.json",
    );
    for (var data in jsonData) {
      dssrContacts.add(UsefulContact.fromJson(data));
    }
  }

  Future getVbgUsefulContacts() async {
    List<dynamic> jsonData = await parseJsonFromAssets(
      "assets/data/vbg/centers_vbg_data.json",
    );
    for (var data in jsonData) {
      vbgContacts.add(UsefulContact.fromJson(data));
    }
  }

  Future<List<dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
