import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nchvbg/src/backend/controllers/data_controller.dart';
import 'package:nchvbg/src/backend/models/useful_contact.dart';
import 'package:nchvbg/src/frontend/themes/app_colors.dart';

class ContactsStructuresPage extends StatelessWidget {
  ContactsStructuresPage({
    required this.type,
    required this.contact,
    super.key,
  });
  final String type;
  final UsefulContact contact;
  final DataController dataController = Get.find();

  Widget getListStructure() {
    List<Widget> childrens = <Widget>[];

    if (contact.structures == null) {
      return Container();
    }

    for (var data in contact.structures!) {
      childrens.add(
        ContactStructureItemWidget(
          structure: data,
          type: type,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrens,
    );
  }

  Widget getContactDescriptionMardownWidget() {
    if (contact.description != null) {
      return FutureBuilder<String>(
        future: dataController.getContactCenterDescription(
          type: type,
          description: contact.description!,
        ),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                const Text(
                  "Les services offerts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(20),
                MarkdownBody(data: snapshot.data!),
              ],
            );
          } else if (snapshot.hasError) {
            return Container();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('"${contact.categorie}"'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              getContactDescriptionMardownWidget(),
              const Gap(20),
              getListStructure(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactStructureItemWidget extends StatelessWidget {
  ContactStructureItemWidget({
    Key? key,
    required this.structure,
    required this.type,
  }) : super(key: key);

  final DataController dataController = Get.find();

  final Structure structure;
  final String type;

  Widget getListContacts() {
    List<Widget> childrens = <Widget>[];

    if (structure.contacts == null) {
      return Container();
    }

    for (var data in structure.contacts!) {
      childrens.add(Row(
        children: [
          Text(
            '$data',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(10),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.call)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.sms)),
        ],
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrens,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            // offset: const Offset(2, 3),
            blurRadius: 50,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          structure.adresse != null
              ? Row(
                  children: [
                    const Icon(
                      Iconsax.location,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const Gap(10),
                    Text(
                      '${structure.adresse}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              : Container(),
          const Gap(10),
          Text(
            "${structure.name}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          getListContacts(),
          structure.description != null
              ? ElevatedButton(
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
                    Get.bottomSheet(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        color: Colors.white,
                        child: FutureBuilder<String>(
                          future: dataController.getContactCenterDescription(
                            type: type,
                            description: structure.description!,
                          ),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return Markdown(data: snapshot.data!);
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text(
                                    'Une erreur est survenue. Veuillez réessayer'),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                        ),
                      ),
                    );
                  },
                  child: const Text('Voir les services'),
                )
              : Container(),
          const Row(),
        ],
      ),
    );
  }
}
