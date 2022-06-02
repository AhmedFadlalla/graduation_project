import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/component/constants.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import '../home_layout/cubit/cubit.dart';
import '../home_layout/cubit/states.dart';
import 'cubit/owner_cubit.dart';
import 'cubit/owner_state.dart';



class OwnerHomeScreenLayout extends StatelessWidget {
  final String? ownerId;
  OwnerHomeScreenLayout({this.ownerId});

  @override
  Widget build(BuildContext context) {
    if(oId==null)
      {
        oId=ownerId;

      }

    return BlocConsumer<OwnerCubit,OwnerState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=OwnerCubit.get(context);


        return Scaffold(
          backgroundColor: Color(0xFF4DB6AC),
          body: cubit.ownerScreens[cubit.currentIndex],
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
