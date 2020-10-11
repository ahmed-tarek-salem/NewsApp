import 'package:NewsApp/models/category_models.dart';
import 'package:NewsApp/models/data.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatelessWidget {
  List <NewsModel> listOfNews;
  @override
  Widget build(BuildContext context) {
        List<CategoryModel> listOfCats;
    listOfCats=getCategories();
    return Stack(
        children: [
          SvgPicture.asset('images/undraw_product_tour_foyt.svg',
          ),
          Padding(
            padding: const EdgeInsets.only(left:40.0, right: 40, top: 80),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.7),
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    )
                    ),
                    child: Column(
                      children: [
                        Text(
                          'World News',
                           style: GoogleFonts.oswald(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      color: Colors.black
                    )
                  ),
                        ),
                        SvgPicture.asset('images/icons8-news.svg',
                        height: 120,
                        )
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listOfCats.length,
                    itemBuilder: (context, index){
                      return CategoryCard(listOfCats[index].nameOfCategory);
                    }
                    ),
                )
              ],
            ),
          )
        ],
      );
  }

}