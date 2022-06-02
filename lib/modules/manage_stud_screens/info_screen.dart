import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/cubit.dart';
import 'package:graduation_project/layouts/home_layout/cubit/states.dart';
import 'package:graduation_project/layouts/owner_home_layout/owner_home_Layout.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import '../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../shared/component/constants.dart';
import '../../shared/component/constants.dart';
import '../../shared/network/local/cach_helper.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var ownerNameController=TextEditingController();
    var studNameController=TextEditingController();
    var studAddressController=TextEditingController();

    double height=MediaQuery.of(context).size.height;
    return BlocConsumer<HorseCubit,HorseStates>(
        listener: (context,state){

          if (state is CreateOwnerSuccessState)
            {

              CachHelper.saveData(
                  key: 'uId',
                  value: 'null')
                  .then((value) {
                CachHelper.saveData(
                    key: 'oId',
                    value: state.oId)
                    .then((value) {
                  HorseCubit.get(context).makeOwner();
                  navigateAndFinish(context, OwnerHomeScreenLayout(ownerId: CachHelper.getData(key: 'oId'),));
              });


                });
              // BlocProvider(
              //     create: (context)=>OwnerCubit()..getOwnerData()
              // );

            }
        },
        builder: (context,state){

        return Scaffold(
          backgroundColor: defaultColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height*0.01,
                ),
                Text(
                    'Complete Information',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                  ),
                ),
                SizedBox(
                  height: height*0.01,
                ),
                InkWell(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 65.0,
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage:HorseCubit.get(context).ownerImage==null ?
                          NetworkImage('https://rcmi.fiu.edu/wp-content/uploads/sites/30/2018/02/no_user.png')
                              :FileImage(HorseCubit.get(context).ownerImage!)as ImageProvider,
                        ),
                      ),
                     Icon(Icons.photo_camera),
                    ],
                  ),
                  onTap: (){
                    HorseCubit.get(context).getOwnerImage();
                  },
                ),
                SizedBox(
                  height: height*0.02,
                ),
                defaultFormField(
                    controller: studNameController,
                    type: TextInputType.name,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Stud Name can\'t be empty';
                      }
                    },
                    label: 'Enter Stud Name',
                    prefixIcon: Icons.house),
                SizedBox(
                  height: height*0.02,
                ),
                defaultFormField(
                    controller: studAddressController,
                    type: TextInputType.streetAddress,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Stud Address can\'t be empty';
                      }
                    },
                    label: 'Enter Stud Address',
                    prefixIcon: Icons.location_on),
                SizedBox(
                  height: height*0.02,
                ),
                ConditionalBuilder(
                    condition: state is! CreateOwnerLoadingState,
                    builder: (context)=>materialBottomLogin(
                        pressFunction: (){

                              HorseCubit.get(context).uploadOwnerImage(
                                  studName: studNameController.text,
                                  address: studAddressController.text);

                        },
                        bottomText: 'Confirm',
                        backgroundColor: defaultColor,
                        width: double.infinity),
                    fallback: (context)=>Center(child: CircularProgressIndicator()))
              ],
            ),
          ),
        );
    },
    );
  }
}
