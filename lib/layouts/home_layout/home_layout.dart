import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/component/constants.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


class HomeScreenLayout extends StatelessWidget {

 final  String? userId;
  HomeScreenLayout({this.userId});
  @override
  Widget build(BuildContext context) {
    if(uId==null)
    {
      uId=userId;

    }
    return BlocConsumer<HorseCubit,HorseStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=HorseCubit.get(context);

        return Scaffold(
          appBar: AppBar(
             title: Text(cubit.titles[cubit.currentIndex],),
            actions: [

            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavIndex(index);
            },
          ),
        );
      },
    );
  }
}
