import 'package:flutter/material.dart';

class UpperFloatingWidget extends StatefulWidget {
  const UpperFloatingWidget({super.key});

  @override
  State<UpperFloatingWidget> createState() => _UpperFloatingWidgetState();
}

class _UpperFloatingWidgetState extends State<UpperFloatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              'سجل معنا برواد حراج واكسب ٥٠ نقطة، نزل أربعة إعلانات واكسب ٢٠٠ نقطة',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                height: 1.4, // Line spacing for better readability
              ),
              textDirection: TextDirection.rtl, // Right-to-left for Arabic
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}