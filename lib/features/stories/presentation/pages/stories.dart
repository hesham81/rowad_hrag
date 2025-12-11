import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:story/story_page_view.dart';

import '../../domain/entities/story.dart';

class ViewStory extends StatefulWidget {
  final Story stories;

  const ViewStory({
    super.key,
    required this.stories,
  });

  @override
  State<ViewStory> createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StoryPageView(
        pageLength: 1,
        storyLength: (_) => 1,

        // Instagram-like time (5 seconds)
        indicatorDuration: const Duration(milliseconds: 5000),

        indicatorHeight: 0.004.height,
        indicatorVisitedColor: AppColors.greenColor,
        indicatorUnvisitedColor: Colors.white38,

        itemBuilder: (context, pageIndex, storyIndex) {
          final story = widget.stories;

          return Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: story.file,
                  fit: BoxFit.cover,
                ),
              ),

              // uploader information
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white24,
                      backgroundImage: CachedNetworkImageProvider(
                        story.uploaderImage,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      story.uploaderName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              if (story.title != null && story.title!.isNotEmpty)
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Text(
                    story.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          );
        },

        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 32, right: 8),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          );
        },

        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
