import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/linked_text.dart';
import 'package:rowad_hrag/core/widget/product_review_widget.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/plans/presentation/pages/plans_screen.dart';
import 'package:rowad_hrag/features/product_details/data/models/message_request_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/models/product_details_data_model.dart';
import 'package:rowad_hrag/features/product_details/presentation/widgets/message_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

  List<String> images = [];
  bool inited = false;

  _initImages(ProductDetailsDataModel data) {
    inited = true;
    List<String> imagesData = [];

    images = data.photos;
    for (var image in images) {
      image = image.replaceAll("storage", "public");
      imagesData.add(image);
    }
    images = imagesData;
    images.add("https://rowad-harag.com/public/${data.image}");
    // setState(() {});
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

  var controller = PageController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductDetailsCubit>();
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
      if (state is ProductDetailsLoaded) {
        if (!inited) {
          _initImages(state.productDetailsDataModel);
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ArrowWidget(),
                      Text(
                        "تفاصيل المنتج",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.greenColor,
                            ),
                      ),
                      IconButton(
                        onPressed: () {
                          _showMessageContent(
                            state.productDetailsDataModel.name,
                            cubit.sendMessage,
                            state.productDetailsDataModel.user.id,
                          );
                        },
                        icon: Icon(
                          Icons.message_outlined,
                          color: AppColors.greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
                0.03.height.hSpace,
                Container(
                  width: double.maxFinite,
                  height: 0.3.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: AppColors.greenColor,
                      width: 1.4,
                    ),
                  ),
                  child: PageView(
                    controller: controller,
                    padEnds: false,
                    pageSnapping: true,
                    // 👈 Enable snapping
                    physics: const ClampingScrollPhysics(),
                    // or BouncingScrollPhysics() if preferred
                    onPageChanged: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                    children: images
                        .map(
                          (e) => ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: CachedNetworkImage(
                              imageUrl: e,
                              width: double.maxFinite,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                0.02.height.hSpace,
                SmoothPageIndicator(
                  controller: controller,
                  count: images.length,
                  onDotClicked: (index) => setState(() {
                    selectedIndex = index;
                  }),
                  effect: ColorTransitionEffect(
                    activeDotColor: AppColors.greenColor,
                  ),
                ).center,
                0.02.height.hSpace,
                Text(
                  state.productDetailsDataModel.name,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                0.02.height.hSpace,
                Text(
                  "الوصف",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ),
                0.02.height.hSpace,
                ClickableText(
                  text: state.productDetailsDataModel.description,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black.withAlpha(130),
                      ),
                ),
                0.02.height.hSpace,
                Text(
                  "التعليقات",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ),
                0.02.height.hSpace,
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProductReviewWidget(
                    review: state.productDetailsDataModel.reviews[index],
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.productDetailsDataModel.reviews.length,
                ),
                0.02.height.hSpace,
                Text(
                  "السعر",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ),
                0.02.height.hSpace,
                Text(
                  "${state.productDetailsDataModel.unitPrice.toString()} ريال  ",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black.withAlpha(130),
                      ),
                ),
                0.02.height.hSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      state.productDetailsDataModel.user.name,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    0.03.width.vSpace,
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        state.productDetailsDataModel.user.avatar ??
                            "data:image/png;base64,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",
                      ),
                    ),
                  ],
                ).alignRight(),
                0.02.height.hSpace,
                CustomElevatedButton(
                  onPressed: (token == null)
                      ? () => pushNamed(
                          newPage: RouteNames.signIn, context: context)
                      : () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.plans,
                          );
                        },
                  child: Text(
                    "دفع الرسوم",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                0.04.height.hSpace,
              ],
            ).hPadding(0.03.width),
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
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      }
    });
  }
}
