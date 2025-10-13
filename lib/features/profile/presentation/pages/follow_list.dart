import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/features/profile/presentation/widgets/follow_person.dart';
import 'package:rowad_hrag/features/profile/presentation/widgets/profile_follow_container.dart';
  bool  _isFollowing=false;
class FollowList extends StatefulWidget {
  const FollowList({super.key});

  @override
  State<FollowList> createState() => _FollowListState();
}

class _FollowListState extends State<FollowList> {
  @override
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: _selectedIndex,
          child: Builder(
            builder: (context) {
              final TabController tabController = DefaultTabController.of(context);
              tabController.addListener(() {
                if (!tabController.indexIsChanging) {
                  setState(() {
                    _selectedIndex = tabController.index;
                  });
                }
              });
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ArrowWidget(
                        isForward: false,
                      ),
                      Text(
                        "قائمة المتابعة",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                            ),
                      ),
                    ],
                  ).hPadding(0.04.width),
                  0.05.height.hSpace,
                  SizedBox(
                    height: 80,
                    width: 0.8.width,
                    child: FollowPerson(name: "عبد الرحمن",imageUrl: "assets/icons/2f83d3608ee132ff39b96eb08a795cb7eac7e6ea.png",followers: 2,)),
                  0.05.height.hSpace,
                  TabBar(
                    dividerColor: AppColors.thirdColor.withAlpha(40),
                    indicatorColor: AppColors.thirdColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: (value) {
                      
                      setState(() {
                        _selectedIndex = value;
                      });
                      
                    },
                    tabs: [
                      Text("أقسام وكلمات البحث",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: _selectedIndex == 0? AppColors.thirdColor : Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                      Text("أعضاء تتابعهم",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: _selectedIndex == 1 ? AppColors.thirdColor : Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                      Text("أعضاء يتابعونك ",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: _selectedIndex == 2 ? AppColors.thirdColor : Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                    ],
                  ),
                  0.04.height.hSpace,
                  _selectedIndex==0? _one()
                              :_selectedIndex==1?_two():_three(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _three(){
    return Column(
      children: [],
    );
}

Widget _two(){
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 0.8.width,
          child: ProfileFollowContainer(
            name: "عبدالرحمن",
            imageUrl: "assets/icons/2f83d3608ee132ff39b96eb08a795cb7eac7e6ea.png",
            isFollowing: _isFollowing, // or false
          ),
        ),

      ],
    );
}

Widget _one(){
    return Column(
      children: [
        
      ],
    );
}
