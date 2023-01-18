import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../themes/app_colors.dart';

class ViolenceItemCard extends StatelessWidget {
  const ViolenceItemCard({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0XFF3E4354),
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
