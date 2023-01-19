import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/presentation/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:news_bloc/presentation/screens/search_screen/view/search_screen.dart';

import '../../../../router/screen_navigation_constants.dart';
import '../../../../theme/app_colors.dart';
import '../../news_feed_screen/view/news_feed_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          switch (state.navbarItem) {
            case DashboardItemEnum.home:
              return const NewsFeedScreen();
            case DashboardItemEnum.search:
              return const SearchScreen();
          }
        },
      ),
      bottomNavigationBar: const _MyBottomNavigationBarWidget(),
    );
  }
}

class _MyBottomNavigationBarWidget extends StatelessWidget {
  const _MyBottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.blue_4E5,
          unselectedItemColor: AppColors.grey_3BF,
          currentIndex: state.index,
          onTap: (index) {
            switch (index) {
              case 0:
                context
                    .read<DashboardCubit>()
                    .getNavBarItem(DashboardItemEnum.home);
                break;
              case 1:
                context
                    .read<DashboardCubit>()
                    .getNavBarItem(DashboardItemEnum.search);
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              label: BottomNavigationScreens.homeScreen,
              icon: Icon(Icons.feed_outlined),
            ),
            BottomNavigationBarItem(
              label: BottomNavigationScreens.searchScreen,
              icon: Icon(Icons.search_outlined),
            ),
          ],
        );
      },
    );
  }
}
