import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class PageSwipeCubit extends Cubit<int> {
  PageSwipeCubit() : super(0);

  void pageSwipe(int idx) => emit(idx);
}
