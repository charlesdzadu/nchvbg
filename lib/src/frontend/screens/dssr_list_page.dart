import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nchvbg/src/frontend/screens/dssr_info_detail_page.dart';

import '../components/cards/violence_item_card.dart';
import '../components/input_fields/search_field_widget.dart';
import '../themes/app_colors.dart';
import '../utils/project_constants.dart';

class DssrListPage extends StatelessWidget {
  const DssrListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Les droits de la reproduction et de la santé sexuelle,',
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text('Trouver des centre DSSR'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ProjectConstants.marge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchInputFieldWidget(),
            const Gap(20),
            const Text(
              'Les informations sur le DSSR',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            ViolenceItemCard(
              title: "Informations générales DSSR",
              onTap: () {
                Get.to(
                  () => DssrInfoDetailPage(
                    slug: "information_generale",
                    title: "Informations générales DSSR",
                  ),
                );
              },
            ),
            ViolenceItemCard(
              title: "Les instruments juriridiques",
              onTap: () {
                Get.to(
                  () => DssrInfoDetailPage(
                    slug: "instruments_juridiques",
                    title: "Les instruments juriridiques",
                  ),
                );
              },
            ),
            ViolenceItemCard(
              title: "Les composants des droits",
              onTap: () {
                Get.to(
                  () => DssrInfoDetailPage(
                    slug: "composants_droits",
                    title: "Les composants des droits",
                  ),
                );
              },
            ),
            ViolenceItemCard(
              title: "Infections au VIH et au SIDA",
              onTap: () {
                Get.to(
                  () => DssrInfoDetailPage(
                    slug: "infections_vih",
                    title: "Infections au VIH et au SIDA",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
