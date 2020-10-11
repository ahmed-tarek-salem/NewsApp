import 'package:NewsApp/models/news.dart';
import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsScreen extends StatefulWidget {
 final String nameOfCategory;
  NewsScreen(this.nameOfCategory);
  @override
  _NewsScreenState createState() => _NewsScreenState();
}


class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> myNews=[];
  bool loading=true;
  getNews() async{
   var x= CategoryNews();
   await x.getNews(widget.nameOfCategory);
   myNews= x.myNews;
   setState(() {
     loading=false;
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
      body: loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  SvgPicture.asset('images/${widget.nameOfCategory}.svg',
                  height: 70
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.8),
              ),
              child: Text(
                'Discover The World',
                                  style: GoogleFonts.oswald(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        color: Colors.black
                      )
                    ),
              ),
              
            ),
            SizedBox(height: 20),
            Expanded(
      child: ListView.builder(
        itemCount: myNews.length,
        itemBuilder: (context,index){
         return NewsCard(
            content: myNews[index].content,
            desc: myNews[index].desc,
            sourceName: myNews[index].sourceName,
            title: myNews[index].title,
            url: myNews[index].url,
            urlImage: myNews[index].urlToImage,
          );
        }
      ),
            )
          ],
        ),
    );
  }
}