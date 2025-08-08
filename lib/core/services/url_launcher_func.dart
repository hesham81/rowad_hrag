import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherFunc {
  static Future<void> openWhatsappNumber() async {
    await launchUrl(
      Uri.parse(
        "https://api.whatsapp.com/send/?phone=966537666980&text=Hello&type=phone_number&app_absent=0",
      ),
    );
  }

  static Future<void> openUrl(String url) async {
    var token = await CashHelper.getString("Auth");
    await launchUrl(
      Uri.parse(
        url,

      ),

    );
  }
}
