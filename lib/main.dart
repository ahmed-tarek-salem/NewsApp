import 'package:NewsApp/widgets/provider.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<myProvider>(
        create: (context){
          return myProvider();
        },
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}