import 'package:NewsApp/widgets/provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'modules/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}
// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<myProvider>(
      create: (context) {
        return myProvider();
      },
      child: Sizer(
        builder: (context, orientation, devicetype) {
          return MaterialApp(
            locale: DevicePreview.locale(context), // Add the locale here
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            home: WelcomeScreen(),
          );
        },
      ),
    );
  }
}
