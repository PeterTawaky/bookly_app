import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static double getRandomDoubleNumber(int maxLimit) {
    Random random = Random();
    double raw = random.nextDouble() * maxLimit; // 0.0 to 5.0
    return double.parse(raw.toStringAsFixed(1)); // Rounded to 1 decimal place
  }

  //for URL launcher Package
  static Future<void> launingchUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
