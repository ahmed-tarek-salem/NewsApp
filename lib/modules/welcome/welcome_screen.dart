import 'package:NewsApp/layout/home_layout.dart';
import 'package:NewsApp/modules/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:NewsApp/shared/components/const.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              child: SvgPicture.asset(
                'images/undraw_Mobile_life_re_jtih.svg',
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0.sp),
                  width: 60.0.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.6),
                    borderRadius: BorderRadius.circular(7.0.sp),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'WELCOME!',
                        style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                                fontSize: 23.0.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Text(
                        'The world is in your hand\'s.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 15.0.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 12.5.h,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeLayout();
                    }));
                  },
                  child: Container(
                    color: kPrimaryColor,
                    child: Center(
                      child: Text(
                        'GET STARTED',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return InfoScreen();
                      }));
                    },
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'CONTACT US',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
