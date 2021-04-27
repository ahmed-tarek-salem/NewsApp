import 'package:NewsApp/shared/network/remote/http_methods.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/modules/news/news_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class NewsScreen extends StatefulWidget {
  final String? nameOfCategory;
  NewsScreen(this.nameOfCategory);
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> myNews = [];
  bool loading = true;
  getNews() async {
    var x = HttpMethods();
    await x.getNews(widget.nameOfCategory);
    myNews = x.myNews;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      body: loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0.w, right: 4.0.w, top: 3.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 15.0.sp,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SvgPicture.asset('images/${widget.nameOfCategory}.svg',
                          height: 11.0.h)
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0.sp),
                    color: Colors.white.withOpacity(.8),
                  ),
                  child: Text(
                    'Discover The World',
                    style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                            fontSize: 23.0.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            color: Colors.black)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: myNews.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          content: myNews[index].content,
                          desc: myNews[index].desc,
                          sourceName: myNews[index].sourceName,
                          title: myNews[index].title,
                          url: myNews[index].url,
                          urlImage: myNews[index].urlToImage,
                        );
                      }),
                )
              ],
            ),
    );
  }
}
