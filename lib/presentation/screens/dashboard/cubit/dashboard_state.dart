part of 'dashboard_cubit.dart';

enum DashboardItemEnum { home, search }

class DashboardState extends Equatable {
  final DashboardItemEnum navbarItem;
  final int index;

  const DashboardState(this.navbarItem, this.index);

  @override
  List<Object?> get props => [navbarItem, index];
}
