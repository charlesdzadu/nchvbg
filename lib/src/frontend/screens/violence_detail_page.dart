import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nchvbg/src/backend/controllers/data_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes/app_colors.dart';
import '../themes/app_theme.dart';
import '../utils/project_constants.dart';

class ViolenceDetailPage extends StatelessWidget {
  const ViolenceDetailPage({
    required this.violenceSlug,
    required this.title,
    super.key,
  });
  final String violenceSlug;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
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
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ProjectColors.primary,
                            strokeAlign: StrokeAlign.inside,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://www.plumedafrique.com/wp-content/uploads/2021/11/Lutte-contre-les-violences-basees-sur-le-genre.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: (Get.width / 2) - 60,
                  child: Row(
                    children: const [
                      SlideButtonWidget(
                        isAstive: true,
                        activeColor: ProjectColors.white,
                      ),
                      SlideButtonWidget(),
                      SlideButtonWidget(),
                      SlideButtonWidget(),
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ProjectColors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Center(
                      child: Icon(
                        Iconsax.volume_high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            Expanded(
              child: ViolenceDetailTabBarWidget(
                violenceSlug: violenceSlug,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViolenceDetailTabBarWidget extends StatefulWidget {
  const ViolenceDetailTabBarWidget({
    Key? key,
    required this.violenceSlug,
  }) : super(key: key);
  final String violenceSlug;

  @override
  State<ViolenceDetailTabBarWidget> createState() =>
      _ViolenceDetailTabBarWidgetState();
}

class _ViolenceDetailTabBarWidgetState extends State<ViolenceDetailTabBarWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          isScrollable: false,
          unselectedLabelColor: ProjectColors.primary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ProjectColors.primary,
          ),
          tabs: const [
            Tab(text: "Description"),
            Tab(text: "Les lois"),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ViolenceDetailDescription(
                violenceSlug: widget.violenceSlug,
              ),
              Column(
                children: const [
                  CustomAccordeonWidget(
                    title: "Les lois internationales",
                    slug: "lois_internationales",
                  ),
                  CustomAccordeonWidget(
                    title: "La constitution de 1992",
                    slug: "constitutions_1992",
                  ),
                  CustomAccordeonWidget(
                    title: "Le code électorales",
                    slug: "codes_electorales",
                  ),
                  CustomAccordeonWidget(
                    title: "Mesures repressives",
                    slug: "mesures_repressives",
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ViolenceDetailDescription extends StatelessWidget {
  ViolenceDetailDescription({
    Key? key,
    required this.violenceSlug,
  }) : super(key: key);
  final String violenceSlug;
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: dataController.getViolenceData(violenceSlug),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
            styleSheet: ProjectTheme.markdownStyle,
            selectable: true,
            onTapLink: ((text, href, title) {
              if (href == null) {
                return;
              }
              launchUrl(
                Uri.parse(href),
                mode: LaunchMode.externalApplication,
              );
            }),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Nous avons rencontré un problème"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class CustomAccordeonWidget extends StatelessWidget {
  const CustomAccordeonWidget({
    Key? key,
    required this.title,
    required this.slug,
  }) : super(key: key);
  final String title;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              ViolenceLawBottomSheet(
                slug: slug,
                title: title,
              ),
              isScrollControlled: true,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: ProjectColors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.message_2,
                  color: ProjectColors.white,
                  size: 25,
                ),
                const Gap(20),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Gap(20),
                const Icon(
                  Iconsax.arrow_right_3,
                  color: ProjectColors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ViolenceLawBottomSheet extends StatelessWidget {
  ViolenceLawBottomSheet({
    Key? key,
    required this.slug,
    required this.title,
  }) : super(key: key);
  final String slug;
  final String title;
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 50,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Iconsax.close_circle),
                ),
                const Gap(20),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<String>(
              future: dataController.getVbgLawData(slug),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data!,
                    styleSheet: ProjectTheme.markdownStyle,
                    selectable: true,
                    onTapLink: ((text, href, title) {
                      if (href == null) {
                        return;
                      }
                      launchUrl(
                        Uri.parse(href),
                        mode: LaunchMode.externalApplication,
                      );
                    }),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Nous avons rencontré un problème"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class SlideButtonWidget extends StatelessWidget {
  const SlideButtonWidget({
    Key? key,
    this.isAstive = false,
    this.activeColor = ProjectColors.primary,
    this.inactiveColor = ProjectColors.softGrey,
  }) : super(key: key);
  final bool isAstive;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10,
        width: isAstive ? 50 : 10,
        decoration: BoxDecoration(
          color: isAstive ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ProjectColors.primary,
            strokeAlign: StrokeAlign.outside,
            width: 2,
          ),
        ),
      ),
    );
  }
}
