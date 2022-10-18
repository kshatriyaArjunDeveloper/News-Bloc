import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/core/values/screen_navigation_constants.dart';
import 'package:news_bloc/presentation/screens/dashboard/cubit/b_n_b_cubit.dart';
import 'package:news_bloc/presentation/screens/home_screen/view/home_screen.dart';
import 'package:news_bloc/presentation/screens/search_screen/view/search_screen.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BNBCubit, BNBState>(
        builder: (context, state) {
          switch (state.navbarItem) {
            case BNBItemEnum.home:
              return const HomeScreen();
            case BNBItemEnum.search:
              return const SearchScreen();
          }
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBarWidget(),
    );
  }
}

class MyBottomNavigationBarWidget extends StatelessWidget {
  const MyBottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BNBCubit, BNBState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.greyLight,
          currentIndex: state.index,
          onTap: (index) {
            switch (index) {
              case 0:
                context.read<BNBCubit>().getNavBarItem(BNBItemEnum.home);
                break;
              case 1:
                context.read<BNBCubit>().getNavBarItem(BNBItemEnum.search);
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
