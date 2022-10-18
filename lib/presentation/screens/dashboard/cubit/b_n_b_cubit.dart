import 'package:bloc/bloc.dart';

part 'b_n_b_state.dart';

class BNBCubit extends Cubit<BNBState> {
  BNBCubit() : super(BNBState(BNBItemEnum.home, 0));

  getNavBarItem(BNBItemEnum navbarItem) {
    switch (navbarItem) {
      case BNBItemEnum.home:
        emit(BNBState(BNBItemEnum.home, 0));
        break;
      case BNBItemEnum.search:
        emit(BNBState(BNBItemEnum.search, 1));
        break;
    }
  }
}
