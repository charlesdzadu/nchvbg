import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routes.dart';
import '../components/input_fields/search_field_widget.dart';
import '../themes/app_colors.dart';
import '../utils/project_constants.dart';
import 'usefuls_contacts_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              left: ProjectConstants.marge,
              right: ProjectConstants.marge,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              color: ProjectColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 100),
                        child: Text(
                          "Luttons tous contre les VBG ",
                          style: TextStyle(
                            color: ProjectColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.menu,
                        color: ProjectColors.white,
                      ),
                    )
                  ],
                ),
                const Gap(30),
                const SearchInputFieldWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ProjectConstants.marge,
            ),
            child: Column(
              children: [
                const Gap(30),
                SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => UsefulsContactsPage());
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0XFF2077FF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Iconsax.message_2,
                                    color: ProjectColors.white,
                                    size: 50,
                                  ),
                                  Gap(10),
                                  Text(
                                    "Contacter un centre d'écoute.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => UsefulsContactsPage());
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF18B77D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: 25,
                                          ),
                                          child: Text(
                                            'Contacts utiles',
                                            style: TextStyle(
                                              color: ProjectColors.white,
                                              fontSize: 18,
                                              height: 1.2,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Iconsax.arrow_right_3,
                                        color: ProjectColors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.vbgList);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFFF9D00),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: 25,
                                          ),
                                          child: Text(
                                            'Tous savoir sur les VBG',
                                            style: TextStyle(
                                              color: ProjectColors.white,
                                              fontSize: 18,
                                              height: 1.2,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Iconsax.arrow_right_3,
                                        color: ProjectColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.dssrList);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0XFFFFB200),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Iconsax.message_2,
                            color: ProjectColors.white,
                            size: 50,
                          ),
                          Gap(20),
                          Expanded(
                            child: Text(
                              "A savoir sur les Droits de la reproduction et de la Santé Sexuelle",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Gap(20),
                          Icon(
                            Iconsax.arrow_right_3,
                            color: ProjectColors.white,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
