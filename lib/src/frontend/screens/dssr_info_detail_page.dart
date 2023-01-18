import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../backend/controllers/data_controller.dart';
import '../themes/app_theme.dart';

class DssrInfoDetailPage extends StatelessWidget {
  DssrInfoDetailPage({
    required this.slug,
    required this.title,
    super.key,
  });
  final DataController dataController = Get.find();
  final String slug;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<String>(
        future: dataController.getDssrData(slug),
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
    );
  }
}
