import 'package:NewsApp/widgets/new_card_fav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:NewsApp/widgets/provider.dart';


class Page2 extends StatelessWidget {
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
                        color: Colors.black
                      )
                    ),
              ),
              
            ),
        
        Expanded(
                  child: Consumer<myProvider>(
                builder: (context,myprovider,child){
                  return ListView.builder(
                    itemBuilder: (context,index){
                      return NewsCardFav(
                        content: myprovider.myList[index].content,
                  desc: myprovider.myList[index].desc,
                  sourceName: myprovider.myList[index].sourceName,
                  title: myprovider.myList[index].title,
                  url: myprovider.myList[index].url,
                  urlImage: myprovider.myList[index].urlToImage,

                      );
                    },
                    itemCount: myprovider.myList.length,
                  );
                },
                
          ),
        ),
        
      ],
    );
  }
}