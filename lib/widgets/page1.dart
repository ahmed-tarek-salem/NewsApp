import 'package:NewsApp/models/category_models.dart';
import 'package:NewsApp/models/data.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Page1 extends StatelessWidget {
  List<NewsModel> listOfNews;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> listOfCats;
    listOfCats = getCategories();
    return Stack(
      children: [
        SvgPicture.asset(
          'images/undraw_product_tour_foyt.svg',
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 12.5.h),
          child: Column(
            children: [
              Container(
                height: 31.0.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0.sp),
                    color: Colors.white.withOpacity(.7),
                    border: Border.all(
                      width: 1.2.w,
                      color: Colors.white,
                    )),
                child: Column(
                  children: [
                    Text(
                      'World News',
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 23.0.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              color: Colors.black)),
                    ),
                    SvgPicture.asset(
                      'images/icons8-news.svg',
                      height: 19.0.h,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: listOfCats.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(listOfCats[index].nameOfCategory);
                    }),
              )
            ],
          ),
        )
      ],
    );
  }
}
