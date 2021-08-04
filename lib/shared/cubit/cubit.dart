import 'package:NewsApp/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitalState());

  int index = 0;

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  void changeIndex(int newIndex) {
    index = newIndex;
    emit(ChangeBottomNavbarState());
  }

  // insertDatabase(NewsModel newsModel) async {
  //   await DatabaseHelper.insertData(newsModel);
  // }
}
