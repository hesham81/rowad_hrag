import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';

class WhatsappIconButton extends StatelessWidget {
  const WhatsappIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async{
        await UrlLauncherFunc.openWhatsappNumber();
      },
      backgroundColor: Colors.green,
      child: const Icon(
        FontAwesomeIcons.whatsapp,
        color: Colors.white,
      ),
    );
  }
}
