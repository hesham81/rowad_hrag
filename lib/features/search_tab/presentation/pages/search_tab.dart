import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/search_tab/data/models/search_request_data_model.dart';
import 'package:rowad_hrag/features/search_tab/presentation/manager/search_cubit.dart';
import 'package:rowad_hrag/features/search_tab/presentation/widgets/custom_grid_view.dart';

import '../../../layout/presentation/widget/product_widget.dart';

class SearchTab extends StatelessWidget {
  // 👈 Changed to StatelessWidget
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const _SearchTabContent(),
    );
  }
}

class _SearchTabContent extends StatefulWidget {
  const _SearchTabContent({super.key});

  @override
  State<_SearchTabContent> createState() => _SearchTabContentState();
}

class _SearchTabContentState extends State<_SearchTabContent> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CupertinoSearchTextField(
                placeholder: "ابحث عن ماتريد",
                controller: searchController,
                onChanged: (value) async {
                  var searchRequest = SearchRequestDataModel(
                    name: value,
                  );
                  await cubit.search(searchRequest);
                },
              ),
              0.02.height.hSpace,
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  var handler = state as Handler;
                  switch (handler) {
                    case SearchError():
                      return Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                          ),
                          0.02.height.hSpace,
                          Text(
                            handler.message,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      );
                    case SearchInitial():
                      return const SizedBox();
                    case SearchLoading():
                      return CircularProgressIndicator(
                        color: AppColors.thirdColor,
                      );
                    case SuccessSearch():
                      return (handler.products.isEmpty)
                          ? Lottie.asset(
                              AppAssets.noSearchResult,
                            )
                          : CustomGridView(
                              crossAxisCount: 4,
                              products: handler.products,
                            );
                  }
                },
              )
            ],
          ).hPadding(0.03.width),
        ),
      ),
    );
  }
}
