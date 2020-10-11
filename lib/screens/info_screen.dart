import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
_launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  String toMail= 'ziad_ahmed199690@yahoo.com';
  String subject= '';
  String body='';
  String name='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
          children: [
            Positioned(
      child: Container(
        height: 230,
        width: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(230),
          color: Colors.yellow
        ),
      
      ),
      top: 50,
      left: -115,
      ),
            Positioned(
      child: Container(
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(350),
          color: Colors.blue
        ),
      
      ),
      bottom: -150,
      right: -100,
      ),
      Padding(
        padding: const EdgeInsets.only(left:30.0, right: 30, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact us',
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600
                )
              )
            ),
            SizedBox(height: 30,),
            Text(
              'Leave us a message we will contact you as soon as possible.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
               border: OutlineInputBorder(),
                labelText: 'Your name',
              ),
              onChanged: (value){
                name=value;
              },
            ),
             SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
               border: OutlineInputBorder(),
                labelText: 'Message Subject',
              ),
              onChanged: (value){
                subject= value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
             minLines: 8, maxLines: 8,
            decoration: InputDecoration(
             border: OutlineInputBorder(),
              hintText: 'Your Message',
            ),
            onChanged: (value){
              body=value;
            },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
             return  _launchURL(toMail, '$subject', 
"""Name : $name

Message : $body """
             );
              },
                  child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff00CF90),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: Icon(Icons.send_sharp, color: Colors.white,), onPressed: (){

                    }),
                    Text('Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                    ),
                  ],
                )),
              ),
            )

          
          ],
        ),
      )
      
          ],
            fit: StackFit.expand,
        ),
    );
  }
}

/* */