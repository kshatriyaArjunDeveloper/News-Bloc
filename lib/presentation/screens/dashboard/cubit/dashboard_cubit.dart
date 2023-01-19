import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(const DashboardState(
          DashboardItemEnum.home,
          0,
        ));

  void getNavBarItem(DashboardItemEnum navbarItem) {
    switch (navbarItem) {
      case DashboardItemEnum.home:
        emit(const DashboardState(DashboardItemEnum.home, 0));
        break;
      case DashboardItemEnum.search:
        emit(const DashboardState(DashboardItemEnum.search, 1));
        break;
    }
  }
}
