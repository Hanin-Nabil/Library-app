import 'package:booklyapp/core/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLaunch(BuildContext context, String? urlString) async {
  if (urlString != null) {
    Uri uri = Uri.parse(urlString); // ✅ تغيير الاسم لتجنب التعارض
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      cusromSnackbar(context, 'It Cannot open the url !$urlString');
    }
  }
}
