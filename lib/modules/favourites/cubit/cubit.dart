import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/modules/favourites/cubit/states.dart';
import 'package:NewsApp/shared/network/local/database_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit() : super(InitFavouriteState());
  // FavouriteCubit(FavouriteStates initialState) : super(initialState);
  //
  static FavouriteCubit get(context) {
    return BlocProvider.of(context);
  }

  List<NewsModel> myList = [];

  addToMyList(NewsModel singleItem) async {
    myList.add(singleItem);
    await DatabaseHelper.insertData(singleItem);
    emit(AddingToListState());
  }

  removeFromMyList(NewsModel singleItem) {
    for (int i = 0; i < myList.length; i++) {
      if (myList[i].title == singleItem.title) {
        myList.remove(myList[i]);
      }
    }
    DatabaseHelper.deleteOneItem(singleItem);
    emit(RemovingFromListState());
  }

  fetchDataFromSQl() async {
    var listOfNews = await DatabaseHelper.getData();
    var list = listOfNews.map((e) => NewsModel.fromJson(e)).toList();
    myList = list;
    emit(FetchDataFromMySqlState());
  }
}
