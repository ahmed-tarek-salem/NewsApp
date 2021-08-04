import 'package:NewsApp/modules/favourites/cubit/cubit.dart';
import 'package:NewsApp/modules/favourites/cubit/states.dart';
import 'package:NewsApp/modules/favourites/new_card_fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(.8),
          ),
          child: Text(
            'Your Favorite List',
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    color: Colors.black)),
          ),
        ),
        Expanded(
          child: BlocConsumer<FavouriteCubit, FavouriteStates>(
            listener: (context, state) {},
            builder: (context, state) {
              FavouriteCubit cubit = FavouriteCubit.get(context);

              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsCardFav(
                    content: cubit.myList[index].content,
                    desc: cubit.myList[index].desc,
                    sourceName: cubit.myList[index].sourceName,
                    title: cubit.myList[index].title,
                    url: cubit.myList[index].url,
                    urlImage: cubit.myList[index].urlToImage,
                  );
                },
                itemCount: cubit.myList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
