import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../themes/app_colors.dart';
import '../utils/project_constants.dart';

class ViolenceDetailPage extends StatelessWidget {
  const ViolenceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Les violences conjugales"),
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
            const Expanded(
              child: ViolenceDetailTabBarWidget(),
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
  }) : super(key: key);

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
              Container(),
              Column(
                children: const [
                  CustomAccordeonWidget(
                    title: "Les lois internationales",
                    content: Text('somethin great'),
                  ),
                  CustomAccordeonWidget(
                    title: "Les lois internationales",
                    content: Text('somethin great'),
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

class CustomAccordeonWidget extends StatefulWidget {
  const CustomAccordeonWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final Widget content;

  @override
  State<CustomAccordeonWidget> createState() => _CustomAccordeonWidgetState();
}

class _CustomAccordeonWidgetState extends State<CustomAccordeonWidget> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
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
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Gap(20),
                Icon(
                  isOpen ? Iconsax.arrow_down_1 : Iconsax.arrow_right_3,
                  color: ProjectColors.white,
                ),
              ],
            ),
          ),
        ),
        isOpen ? widget.content : Container()
      ],
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
