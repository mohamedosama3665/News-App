import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/modules/technology/technology_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.electrical_services), label: 'Technology'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),

  ];

  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    TechnologyScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index == 0)
      getBusiness();
    else if(index == 1)
      getSports();
    else if(index == 2)
      getTechnology();
    else if(index == 3)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> technology = [];
  DioHelper dioHelper = DioHelper();

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '4bc831286a4c409c8d062693f684db3d'
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());

    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'technology',
      'apiKey': '4bc831286a4c409c8d062693f684db3d'
    }).then((value) {
      technology = value.data['articles'];
      emit(NewsGetTechnologySuccessState());
    }).catchError((error) {
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());

    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '4bc831286a4c409c8d062693f684db3d'
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }
  void getScience() {
    emit(NewsGetScienceLoadingState());

    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '4bc831286a4c409c8d062693f684db3d'
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  bool isDark = false;
  void changeAppMode()
  {
      isDark = !isDark;
      emit(AppChangeModeState());
  }

}
