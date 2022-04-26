import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Doctor_Cubit/doc_cubit.dart';
import 'Doctor_Cubit/doc_states.dart';

class DocHomeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=DoctorCubit.get(context);
        return Scaffold(
          body: cubit.docScreens[cubit.currentIndex],
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