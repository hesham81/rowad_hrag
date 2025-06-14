import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/plans/presentation/pages/plans_screen.dart';
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
  var images = [
    "https://rowad-harag.com/public/uploads/all/0uSVSxT9RQQn5pW3PqRRIm99HyrnzvSeO013k4vf.jpg",
    "https://rowad-harag.com/public/uploads/all/jfaGGmx24gRpVruqUi7KhnkZ355ULvS6DL7wk8hH.jpg",
    "https://rowad-harag.com/public/uploads/all/bhArJyYcTyZAJMXd7lDRW45eW5Op154N2jI6TrrQ.jpg",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductDetailsCubit>();
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
      if (state is ProductDetailsLoaded) {
        return Scaffold(
          floatingActionButton: WhatsappIconButton(),
          bottomNavigationBar: CustomElevatedButton(
            child: Text(
              "دفع الرسوم",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            onPressed: () => slideLeftWidget(
              newPage: PlansScreen(),
              context: context,
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
                // https://rowad-harag.com/public/
                CachedNetworkImage(
                  imageUrl:
                      "https://rowad-harag.com/public/${state.productDetailsDataModel.image}",
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
                            imageUrl: images[index],
                            fit: BoxFit.fill,
                            height: 0.15.height,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 0.01.width.vSpace,
                    itemCount: images.length,
                  ),
                ),
                0.01.height.hSpace,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.productDetailsDataModel.name ?? "",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    0.01.height.hSpace,
                    Text(
                      "المنطقه : تبوك",
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(),
                    ).alignRight(),
                    0.01.height.hSpace,
                    Text(
                      "المدينة : تبوك",
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(),
                    ).alignRight(),
                    0.01.height.hSpace,
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
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
