import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
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
                        "طلبات الشراء",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                            ),
                      ),
                    ],
                  ).hPadding(0.04.width),
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
                      Text("طلباتي",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: _selectedIndex == 0 ? AppColors.thirdColor : Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                      Text("طلبات العملاء",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: _selectedIndex == 1 ? AppColors.thirdColor : Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                    ],
                  ),
                  0.04.height.hSpace,
                  _selectedIndex==0? _talabti()
                              :_talabtelalamaaa(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _talabti(){
    return Column(
      children: [],
    );
}

Widget _talabtelalamaaa(){
    return Column(
      children: [
        Text("test")
      ],
    );
}