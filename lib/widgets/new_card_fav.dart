import 'package:NewsApp/models/news_model.dart';
import 'package:NewsApp/screens/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NewsApp/widgets/provider.dart';
class NewsCardFav extends StatefulWidget {
   final String url;
 final String urlImage;
 final String title;
 final String desc;
 final String content;
 final String sourceName;
  NewsCardFav({this.url, this.title, this.urlImage, this.desc,this.content, this.sourceName});

  @override
  _NewsCardFavState createState() => _NewsCardFavState();
}

class _NewsCardFavState extends State<NewsCardFav> {
  var myIcon= Icons.favorite;
  var iconColor= Colors.red;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context){
         return ArticleScreen(widget.url);
       }));
     },
      child: Container(
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    height: 140,
    width: double.infinity,
    child: Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                   child: Image(
                  image: NetworkImage(widget.urlImage),
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
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                      widget.sourceName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 10
                      ),
                      ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    ),
                    Expanded(
                        child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
        Positioned(
          child: Consumer<myProvider>(
            builder: (context,myprovider,child){
              return GestureDetector(
              onTap: (){
                NewsModel singleItem =NewsModel();
                singleItem.title= widget.title;
                singleItem.url=widget.url;
                singleItem.urlToImage=widget.urlImage;
                singleItem.sourceName= widget.sourceName;
                
                setState(() {
                  if(myIcon==Icons.favorite)
                  {myprovider.removeFromMyList(singleItem);
                    print(myprovider.myList);
                  }
                 
                });
              },
              child: Icon(myIcon,
              color: iconColor
              ),
            ) ;
            },
            
          ),
          top: 10,
          right: 10,
        )
      ],
    ),
        ),
      );
  }
}