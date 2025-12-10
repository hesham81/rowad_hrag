import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Required for Cupertino widgets
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/extensions/padding.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/features/all_categories/presentation/widgets/all_category_widget.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import '../../../../core/theme/app_colors.dart';

class AllCategories extends StatefulWidget {
  final List<CategoryDataModel> categories;

  const AllCategories({
    super.key,
    required this.categories,
  });

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  late List<CategoryDataModel> _filteredCategories;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCategories = widget.categories;
    _searchController.addListener(_filterCategories);
  }

  void _filterCategories() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = widget.categories;
      } else {
        _filteredCategories = widget.categories
            .where((category) =>
        category.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCategories);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  ArrowWidget(isGoBack: true),
                  const Spacer(),
                  Text(
                    "كل الفئات",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.greenColor,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ).hPadding(0.03.width),

              0.02.height.hSpace,

              // Cupertino Search Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.03.width),
                child: CupertinoSearchTextField(
                  controller: _searchController,
                  placeholder: 'ابحث عن فئة...',
                  onChanged: (_) => _filterCategories(), // Optional: you can also rely on listener
                ),
              ),

              0.02.height.hSpace,

              // Categories List
              if (_filteredCategories.isEmpty)
                Padding(
                  padding: EdgeInsets.all(0.03.width),
                  child: Text(
                    'لا توجد فئات تطابق البحث',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredCategories.length,
                  itemBuilder: (context, index) => AllCategoryWidget(
                    category: _filteredCategories[index],
                  ),
                  separatorBuilder: (context, index) => 0.02.height.hSpace,
                ),
            ],
          ),
        ),
      ),
    );
  }
}