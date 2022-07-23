import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_pickers/View_Models/color_provider.dart';
import 'package:providers_pickers/View_Models/country_provider.dart';
import 'package:providers_pickers/View_Models/date_provider.dart';
import 'package:providers_pickers/View_Models/images/image_provider.dart';
import 'package:providers_pickers/View_Models/time_provider.dart';
import 'package:providers_pickers/Views/colors/app_colors.dart';
import 'package:providers_pickers/Views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => CustomImageProvider()),
        ChangeNotifierProvider(create: (c) => CustomColorProvider()),
        ChangeNotifierProvider(create: (c) => CustomCountryProvider()),
        ChangeNotifierProvider(create: (c) => CustomDateProvider()),
        ChangeNotifierProvider(create: (c) => CustomTimeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pickers',
        theme: ThemeData.dark().copyWith(
          backgroundColor: AppColors.backgroundColor,
          appBarTheme:
              const AppBarTheme(backgroundColor: AppColors.appBarColor),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
