import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CupertinoSearchTextField(
                placeholder: "ابحث عن ماتريد",
                controller: searchController,
                onChanged: (value) {},
              ),
            ],
          ).hPadding(0.03.width),
        ),
      ),
    );
  }
}
