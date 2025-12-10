import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/stories/data/models/story_data_model.dart';
import 'package:rowad_hrag/features/stories/presentation/pages/stories.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../stories/presentation/manager/story_cubit.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({super.key});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  String? imageUrl;
  String? name;

  Future<void> _init() async {
    imageUrl = await CashHelper.getString("image");
    name = await CashHelper.getString("name");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<StoryCubit, StoryState>(
          builder: (context, state) {
            if (state is StoryInitial ||
                state is StoryLoading ||
                state is UploaderHandlerLoading) {
              return _loadingWidget();
            }

            if (state is StoryError) {
              return _errorWidget(
                state.failure.messageEn ??
                    state.failure.messageAr ??
                    "Failed to load stories",
              );
            }

            if (state is UploaderHandlerError) {
              return _errorWidget(state.failure.toString() ?? "Upload failed");
            }

            if (state is StoryLoaded) {
              return _storiesList(context, state.stories);
            }

            if (state is UploaderHandlerLoaded) {
              context.read<StoryCubit>().getStories();
              return _loadingWidget();
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }

  // ======================================================
  // LOADING WIDGET
  // ======================================================

  Widget _loadingWidget() {
    return Skeletonizer(
      child: SizedBox(
        height: 0.16.height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (_, __) => Column(
            children: [
              const CircleAvatar(radius: 50),
              0.01.height.hSpace,
              Text(
                "Loading",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          separatorBuilder: (_, __) => 0.02.width.vSpace,
        ),
      ),
    );
  }

  // ======================================================
  // ERROR WIDGET
  // ======================================================

  Widget _errorWidget(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  // ======================================================
  // STORIES LIST
  // ======================================================

  Widget _storiesList(BuildContext context, List<StoryDataModel> stories) {
    return FutureBuilder(
      future: CashHelper.getString("token"),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final userToken = snapshot.data ?? "";

        final filteredStories =
        stories.where((s) => s.uid != userToken).toList();

        return SizedBox(
          height: 110,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: filteredStories.length + 1,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _myStoryButton(context, stories);
              }

              final story = filteredStories[index - 1];

              return Column(
                children: [
                  GestureDetector(
                    onTap: () => slideLeftWidget(
                      newPage: ViewStory(stories: story),
                      context: context,
                    ),
                    child: CircularProfileAvatar(
                      story.uploaderImage,
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      borderWidth: 3,
                      borderColor: AppColors.greenColor,
                      elevation: 2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 80,
                    child: Text(
                      story.uploaderName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }



  // ======================================================
  // MY STORY BUTTON
  // ======================================================

  Widget _myStoryButton(BuildContext context, List<StoryDataModel> stories) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final token = await CashHelper.getString("token") ?? "";

            // Get only MY stories
            final myStories = stories.where((s) => s.uid == token).toList();

            // ---- If I HAVE a story → open story ----
            if (myStories.isNotEmpty) {
              slideLeftWidget(
                newPage: ViewStory(
                  stories: myStories.first,
                ),
                context: context,
              );
              return;
            }

            // ---- If I DON'T have a story → upload new story ----
            context.read<StoryCubit>().uploadStory();
          },
          child: CircularProfileAvatar(
            imageUrl ??
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvEsCZ86Sf_Z3Zqh27NLJLG-LtWUea7cljRQ&s",
            radius: 40,
            backgroundColor: Colors.transparent,
            borderWidth: 3,
            borderColor: AppColors.greenColor,
            elevation: 2,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 80,
          child: Text(
            name ?? "My Story",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }


}
