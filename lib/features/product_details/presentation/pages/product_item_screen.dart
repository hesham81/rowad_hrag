import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/plans/presentation/pages/plans_screen.dart';
import 'package:rowad_hrag/features/product_details/data/models/message_request_data_model.dart';
import 'package:rowad_hrag/features/product_details/presentation/widgets/message_content.dart';
import '../../../../core/services/cash_helper.dart';
import '../../../../core/services/url_launcher_func.dart';
import '../../../../core/theme/app_colors.dart';
import '../manager/product_details_cubit.dart';
import '../widgets/product_details_review_widget.dart';

class ProductItemScreen extends StatefulWidget {
  const ProductItemScreen({
    super.key,
  });

  @override
  State<ProductItemScreen> createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  int? selectedIndex;
  String? token;

  Future<void> _getCurrentToken() async {
    token = await CashHelper.getString("token");
    log("Current Token is $token");
    setState(() {});
  }

  @override
  void initState() {
    Future.wait(
      [
        _getCurrentToken(),
      ],
    );
    super.initState();
  }

  _showMessageContent(
    String hint,
    Function(MessageRequestDataModel) onSend,
    int conversationId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 0.5.height,
          width: double.maxFinite,
          child: MessageContent(
            hintText: hint,
            onSend: onSend,
            userId: conversationId,
          ), // But make sure MessageContent doesn't use Scaffold
        ),
        contentPadding: EdgeInsets.zero, // Optional: remove default padding
        scrollable: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductDetailsCubit>();
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
      if (state is ProductDetailsLoaded) {
        return Scaffold(
          floatingActionButton: WhatsappIconButton(),
          bottomNavigationBar: CustomElevatedButton(
            onPressed: (token == null)
                ? () => pushNamed(newPage: RouteNames.signIn, context: context)
                : () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.plans,
                    );
                  },
            child: Text(
              "دفع الرسوم",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              cubit.productDetailsDataModel?.name ?? "",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: (selectedIndex == null)
                      ? "https://rowad-harag.com/public/${state.productDetailsDataModel.image}"
                      : state.productDetailsDataModel.photos[selectedIndex!]
                          .replaceAll("storage", "public"),
                  width: double.maxFinite,
                ),
                0.01.height.hSpace,
                SizedBox(
                  height: 0.15.height,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: CachedNetworkImage(
                            imageUrl: state
                                .productDetailsDataModel.photos[index]
                                .replaceAll("storage", "public"),
                            fit: BoxFit.contain,
                            height: 0.15.height,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 0.01.width.vSpace,
                    itemCount: state.productDetailsDataModel.photos.length,
                  ),
                ),
                0.01.height.hSpace,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            state.productDetailsDataModel.name ?? "",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    0.01.height.hSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          cubit.statesDataModel?.name ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(),
                        ).alignRight(),
                        Text(
                          " :  المنطقه ",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(),
                        ).alignRight(),
                      ],
                    ),
                    0.01.height.hSpace,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Text(
                    //       cubit.cityData?.name ?? "",
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .titleMedium!
                    //           .copyWith(),
                    //     ).alignRight(),
                    //     Text(
                    //       " :  المدينه ",
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .titleMedium!
                    //           .copyWith(),
                    //     ).alignRight(),
                    //   ],
                    // ),
                    // 0.01.height.hSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          state.productDetailsDataModel.user.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(),
                        ),
                        0.01.width.vSpace,
                        Text(
                          " : تم بواسطه",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(),
                        ),
                      ],
                    ),
                    0.01.height.hSpace,
                    InkWell(
                      onTap: (token == null)
                          ? () => pushNamed(
                              newPage: RouteNames.signIn, context: context)
                          : () {
                              _showMessageContent(
                                state.productDetailsDataModel.name,
                                cubit.sendMessage,
                                state.productDetailsDataModel.user.id,
                              );
                            },
                      child: Container(
                        width: 0.25.width,
                        height: 0.04.height,
                        decoration: BoxDecoration(
                            color: Colors.green.withAlpha(90),
                            borderRadius: BorderRadius.circular(80)),
                        child: Icon(
                          Icons.message_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    Row(
                      children: [
                        Text(
                          state.productDetailsDataModel.unitPrice.toString() ??
                              "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryColor),
                        ),
                        Spacer(),
                        Text(
                          "السعر الكلي   ",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    0.01.height.hSpace,
                    Divider(),
                    0.01.height.hSpace,
                    Text(
                      "وصف",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    Text(
                      state.productDetailsDataModel.description ?? "",
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    Divider(),
                    0.01.height.hSpace,
                    Text(
                      "تقيمات الإعلان",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    (state.productDetailsDataModel.reviews.isEmpty)
                        ? Text(
                            "لا يوجد تقيمات",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ProductDetailsReviewWidget(
                                productDetailsReview: state
                                    .productDetailsDataModel.reviews[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                0.01.height.hSpace,
                            itemCount:
                                state.productDetailsDataModel.reviews.length,
                          ).hPadding(0.02.width),
                  ],
                ),
                0.02.height.hSpace,
                Divider().hPadding(0.03),
                0.02.height.hSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          state.productDetailsDataModel.user.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        0.01.height.hSpace,
                        Text(
                          state.productDetailsDataModel.user.email,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    0.05.width.vSpace,
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: CachedNetworkImageProvider(
                        state.productDetailsDataModel.user.avatar ??
                            "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
                      ),
                    ).alignRight(),
                  ],
                ),
                0.02.height.hSpace,
              ],
            ),
          ),
        );
      } else if (state is ProductDetailsError) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "خطأ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 180,
                ),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.secondaryColor,
              color: AppColors.darkTeal,
            ),
          ),
        );
      }
    });
  }
}
