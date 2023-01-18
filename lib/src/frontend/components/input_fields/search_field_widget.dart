import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../themes/app_colors.dart';

class SearchInputFieldWidget extends StatelessWidget {
  const SearchInputFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: ProjectColors.white,
        filled: true,
        prefixIcon: const Icon(Iconsax.search_normal_1),
        hintText: "Que voulez vous savoir aujourd'hui ?",
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
