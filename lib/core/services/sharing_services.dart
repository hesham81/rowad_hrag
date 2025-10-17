import 'package:flutter_share/flutter_share.dart';

abstract class SharingServices {
  static Future<void> share({
    required String title,
    required String text,
    required String linkUrl,
    required String chooserTitle,
  }) async {
    await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: linkUrl,
      chooserTitle: chooserTitle,
    );
  }
}
