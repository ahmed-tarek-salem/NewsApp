import 'package:NewsApp/modules/favourites/cubit/cubit.dart';
import 'package:NewsApp/modules/favourites/cubit/states.dart';
import 'package:NewsApp/shared/network/local/database_helper.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/modules/articles/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:NewsApp/provider.dart';
import 'package:sizer/sizer.dart';

class NewsCard extends StatefulWidget {
  final String? url;
  final String? urlImage;
  final String? title;
  final String? desc;
  final String? content;
  final String? sourceName;
  NewsCard(
      {this.url,
      this.title,
      this.urlImage,
      this.desc,
      this.content,
      this.sourceName});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  var myIcon = Icons.favorite_border_outlined;
  var iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleScreen(widget.url);
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0.w, horizontal: 4.5.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        height: 22.0.h,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0.sp),
                    child: Image(
                      image: NetworkImage(widget.urlImage!),
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 1.5.h, horizontal: 5.0.w),
                        child: Text(
                          widget.sourceName!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 8.0.sp),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0.sp),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 1.0.h, horizontal: 1.5.w),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 1.0.h, horizontal: 5.0.w),
                          child: Text(
                            widget.title!,
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: 11.0.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: BlocConsumer<FavouriteCubit, FavouriteStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  FavouriteCubit cubit = FavouriteCubit.get(context);
                  return GestureDetector(
                    onTap: () async {
                      NewsModel singleItem = NewsModel();
                      singleItem.title = widget.title;
                      singleItem.url = widget.url;
                      singleItem.urlToImage = widget.urlImage;
                      singleItem.sourceName = widget.sourceName;
                      if (myIcon == Icons.favorite_border_outlined) {
                        // print('Is Inserted in UI');
                        setState(() {
                          myIcon = Icons.favorite;
                          iconColor = Colors.red;
                        });

                        cubit.addToMyList(singleItem);
                        // print(cubit.myList);
                      } else {
                        setState(() {
                          myIcon = Icons.favorite_border_outlined;
                          iconColor = Colors.grey;
                        });
                        cubit.removeFromMyList(singleItem);
                        // print(cubit.myList);
                      }
                      // setState(() async {
                      //   if (myIcon == Icons.favorite_border_outlined) {
                      //     //save to database
                      //     var databaseHepler = DatabaseHelper.db;
                      //     await databaseHepler.insertData(singleItem);
                      //     print('Is Inserted in UI');
                      //     myIcon = Icons.favorite;
                      //     iconColor = Colors.red;
                      //     myprovider.addToMyList(singleItem);
                      //     print(myprovider.myList);
                      //   } else {}
                      // });
                    },
                    child: Icon(
                      myIcon,
                      color: iconColor,
                      size: 15.0.sp,
                    ),
                  );
                },
              ),
              top: 1.5.h,
              right: 2.0.w,
            )
          ],
        ),
      ),
    );
  }
}

// Positioned(
//   top: 1.5.h,
//   right: 2.0.w,
//   child: Consumer<myProvider>(
//     builder: (context, myprovider, child) {
//       return GestureDetector(
//         onTap: () async {
//           NewsModel singleItem = NewsModel();
//           singleItem.title = widget.title;
//           singleItem.url = widget.url;
//           singleItem.urlToImage = widget.urlImage;
//           singleItem.sourceName = widget.sourceName;
//           if (myIcon == Icons.favorite_border_outlined) {
//             print('Is Inserted in UI');
//             setState(() {
//               myIcon = Icons.favorite;
//               iconColor = Colors.red;
//             });

//             myprovider.addToMyList(singleItem);
//           } else {
//             setState(() {
//               myIcon = Icons.favorite_border_outlined;
//               iconColor = Colors.grey;
//             });
//             myprovider.removeFromMyList(singleItem);
//           }
//         },
//         child: Icon(
//           myIcon,
//           color: iconColor,
//           size: 15.0.sp,
//         ),
//       );
//     },
//   ),
// )
