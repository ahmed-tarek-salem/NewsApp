import 'package:NewsApp/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CategoryCard extends StatelessWidget {
  final String? nameOfCategory;
  CategoryCard(this.nameOfCategory);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsScreen(nameOfCategory);
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.5.h),
        height: 12.5.h,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.6),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(width: 3.5.w),
            Text(nameOfCategory!.toUpperCase(),
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.w600,
                ))),
          ],
        ),
      ),
    );
  }
}
