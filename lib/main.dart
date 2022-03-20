import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/owner_home_Layout.dart';
import 'package:graduation_project/modules/splash_screen/splashScreen.dart';
import 'package:graduation_project/shared/bloc_observer.dart';
import 'package:graduation_project/shared/component/constants.dart';
import 'package:graduation_project/shared/network/local/cach_helper.dart';
import 'package:graduation_project/shared/styles/themes.dart';

import 'layouts/home_layout/home_layout.dart';
import 'layouts/owner_home_layout/cubit/owner_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await CachHelper.init();
  Widget widget;
  uId = CachHelper.getData(key: 'uId');
  oId =CachHelper.getData(key: 'oId');



  if (uId != null && oId==null) {
    widget = HomeScreenLayout();
  }
  else if(uId != null && oId!=null)
  {
    widget=OwnerHomeScreenLayout();
  }
  else {
    widget = SplashScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HorseCubit()..getUserData()),
          BlocProvider(create: (context) => OwnerCubit()..getOwnerData()..getHorseData())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          home: startWidget,
        ));
  }
}
