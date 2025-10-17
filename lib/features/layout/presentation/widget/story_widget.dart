import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/stories/presentation/pages/stories.dart';

class StoryWidget extends StatefulWidget {
  final String imageUrl;
  final Color? borderColor;

  const StoryWidget({
    super.key,
    required this.imageUrl,
    this.borderColor,
  });

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProfileAvatar(
          widget.imageUrl,
          radius: 0.13.width,


          backgroundColor: Colors.transparent,
          borderWidth: 4.3,
          borderColor: widget.borderColor ?? AppColors.greenColor,
          elevation: 5.0,
          cacheImage: true,
          onTap: () => slideLeftWidget(
            newPage: Stories(),
            context: context,
          ),
          showInitialTextAbovePicture:
              true, // setting it true will show initials text above profile picture, default false
        ),
        0.02.height.hSpace,
        Text(
          "Hisham Aymen",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
