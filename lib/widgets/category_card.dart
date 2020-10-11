import 'package:NewsApp/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoryCard extends StatelessWidget {
  final String nameOfCategory;
  CategoryCard(this.nameOfCategory);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: (){
         Navigator.push(context, MaterialPageRoute(
           builder: (context) {
             return NewsScreen(nameOfCategory);
           }
         ));
       },
          child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.6),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            SizedBox(width: 15),
            Text(
              nameOfCategory.toUpperCase(),
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}