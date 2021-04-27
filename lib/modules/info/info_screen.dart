import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

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

  String toMail = 'ziad_ahmed199690@yahoo.com';
  String subject = '';
  String body = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.clip,
        children: [
          Positioned(
            child: Container(
              height: 56.0.w,
              width: 56.0.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(230),
                  color: Colors.yellow),
            ),
            top: 8.0.h,
            left: -28.0.w,
          ),
          Positioned(
            child: Container(
              height: 85.0.w,
              width: 85.0.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(85.0.w),
                  color: Colors.blue),
            ),
            bottom: -23.5.h,
            right: -24.0.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.0.w, right: 7.0.w, top: 15.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contact us',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 27.0.sp, fontWeight: FontWeight.w600))),
                SizedBox(
                  height: 4.5.h,
                ),
                Text(
                  'Leave us a message we will contact you as soon as possible.',
                  style:
                      TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                TextField(
                  style: TextStyle(fontSize: 12.0.sp),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your name',
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                TextField(
                  style: TextStyle(fontSize: 12.0.sp),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message Subject',
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                  onChanged: (value) {
                    subject = value;
                  },
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                TextField(
                  style: TextStyle(fontSize: 12.0.sp),
                  minLines: 6,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Your Message',
                  ),
                  onChanged: (value) {
                    body = value;
                  },
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                GestureDetector(
                  onTap: () {
                    return _launchURL(toMail, '$subject', """Name : $name

Message : $body """);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 8.0.h,
                    decoration: BoxDecoration(
                        color: Color(0xff00CF90),
                        borderRadius: BorderRadius.circular(4.0.sp)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.send_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        Text(
                          'Send',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w300),
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
