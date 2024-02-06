import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:nchvbg/src/backend/controllers/data_controller.dart';
import 'package:nchvbg/src/backend/models/useful_contact.dart';
import 'package:nchvbg/src/frontend/components/input_fields/search_field_widget.dart';
import 'package:nchvbg/src/frontend/themes/app_colors.dart';

import 'contacts_structures_page.dart';

class UsefulsContactsPage extends StatelessWidget {
  UsefulsContactsPage({super.key});

  final DataController dataController = Get.find();

  Widget getDssrCenter() {
    List<Widget> childrens = <Widget>[];

    for (var data in dataController.dssrContacts) {
      childrens.add(
        UsefulContactCenterItem(
          type: "dssr",
          contact: data,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrens,
    );
  }

  Widget getVbgCenter() {
    List<Widget> childrens = <Widget>[];

    for (var data in dataController.vbgContacts) {
      childrens.add(
        UsefulContactCenterItem(
          type: "vbg",
          contact: data,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrens,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tous les contacts utiles'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchInputFieldWidget(),
              const Gap(20),
              const Text(
                'Les centres DSSR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              getDssrCenter(),
              const Gap(50),
              const Text(
                'Les centres VBG',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              getVbgCenter(),
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}

class UsefulContactCenterItem extends StatelessWidget {
  const UsefulContactCenterItem({
    Key? key,
    required this.type,
    required this.contact,
  }) : super(key: key);
  final String type;
  final UsefulContact contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: ProjectColors.lightPrimary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${contact.categorie}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: ProjectColors.white,
                  textStyle: const TextStyle(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 15,
                  ),
                ),
                onPressed: () {
                  Get.to(() => ContactsStructuresPage(
                        type: type,
                        contact: contact,
                      ));
                },
                child: const Text('Voir les structures'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
