import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layout/cubit/states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  NewsCubit dark = NewsCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (BuildContext context) => NewsCubit()..changeAppMode(),)
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black87),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  selectedLabelStyle: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                  unselectedItemColor: Colors.black54,
                  unselectedLabelStyle: GoogleFonts.aBeeZee(
                      fontSize: 13,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                ),
                textTheme: TextTheme(
                  bodyText1: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Color(0xff232323),
                appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black87,
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: Colors.black87,
                  elevation: 0.0,
                  titleTextStyle: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white70),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Color(0xff232323),
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.white60,
                  selectedLabelStyle: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: GoogleFonts.aBeeZee(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                textTheme: TextTheme(
                  bodyText1: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              themeMode: NewsCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
              home: NewsLayout(),
            );
          }),
    );
  }
}
