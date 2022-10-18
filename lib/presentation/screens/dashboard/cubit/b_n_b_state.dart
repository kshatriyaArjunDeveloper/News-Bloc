part of 'b_n_b_cubit.dart';

enum BNBItemEnum { home, search }

class BNBState {
  final BNBItemEnum navbarItem;
  final int index;

  BNBState(this.navbarItem, this.index);

}
