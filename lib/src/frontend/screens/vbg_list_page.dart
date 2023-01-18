import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../components/input_fields/search_field_widget.dart';
import '../themes/app_colors.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchInputFieldWidget(),
            Gap(20),
            Text(
              'Selectionnez un type de violence',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10),
            ViolenceItemCard(
              title: "Informations générales et conseils à connaitre",
            ),
            ViolenceItemCard(title: "Violence Economique"),
            ViolenceItemCard(title: "Violence Psychologique"),
          ],
        ),
      ),
    );
  }
}

class ViolenceItemCard extends StatelessWidget {
  const ViolenceItemCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: ProjectColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Iconsax.message_2,
                color: ProjectColors.white,
                size: 50,
              ),
              const Gap(20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    fontSize: 18,
                  ),
                ),
              ),
              const Gap(20),
              const Icon(
                Iconsax.arrow_right_3,
                color: ProjectColors.white,
              ),
            ],
          )),
    );
  }
}
