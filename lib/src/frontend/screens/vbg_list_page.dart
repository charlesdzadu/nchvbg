import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:nchvbg/src/frontend/screens/vbg/general_information.dart';
import 'package:nchvbg/src/frontend/screens/violence_detail_page.dart';

import '../components/cards/violence_item_card.dart';
import '../components/input_fields/search_field_widget.dart';
import '../utils/project_constants.dart';

class VbgListPage extends StatelessWidget {
  const VbgListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les violences basées sur le Genre'),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text('Contacter un centre'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ProjectConstants.marge,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchInputFieldWidget(),
              const Gap(20),
              const Text(
                'Selectionnez un type de violence',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              ViolenceItemCard(
                title: "Informations générales et conseils à connaitre",
                onTap: () {
                  Get.to(() => VbgGeneralInformation());
                },
              ),
              ViolenceItemCard(
                title: "Violences Physiques",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences Physiques",
                      violenceSlug: "violences_physiques",
                    ),
                  );
                },
              ),
              ViolenceItemCard(
                title: "Violences Verbales",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences Verbales",
                      violenceSlug: "violences_verbales",
                    ),
                  );
                },
              ),
              ViolenceItemCard(
                title: "Violences Psychologiques",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences Psychologiques",
                      violenceSlug: "violences_psychologiques",
                    ),
                  );
                },
              ),
              ViolenceItemCard(
                title: "Violences Sexuelles",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences Sexuelles",
                      violenceSlug: "violences_sexuelles",
                    ),
                  );
                },
              ),
              ViolenceItemCard(
                title: "Violences Economiques",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences Economiques",
                      violenceSlug: "violences_economiques",
                    ),
                  );
                },
              ),
              ViolenceItemCard(
                title: "Violences Culturelles ou Institutionnalisées",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences Culturelles ou Institutionnalisées",
                      violenceSlug: "violences_culturelles",
                    ),
                  );
                },
              ),
              ViolenceItemCard(
                title: "Violences en ligne ou Violences Numériques",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences en ligne ou Violences Numériques",
                      violenceSlug: "violences_en_ligne",
                    ),
                  );
                },
              ),
              ViolenceItemCard(
                title: "Violences en milieu Scolaire",
                onTap: () {
                  Get.to(
                    () => const ViolenceDetailPage(
                      title: "Violences en milieu Scolaire",
                      violenceSlug: "violences_scolaires",
                    ),
                  );
                },
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
