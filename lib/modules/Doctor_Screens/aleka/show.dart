import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/styles/colors.dart';


import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import '../../../models/alekaamodel.dart';
class ShowDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context, state) {
        
      },
      builder: (context,state){
        return Scaffold(
      body: StreamBuilder(
        stream: DoctorCubit.get(context).getelAlaaik(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<AlekaModel> alaaek=snapshot.data as List<AlekaModel>;
            return ListView.separated(
              itemBuilder: ((context, index) => alekaItem(alaaek[index])),
              separatorBuilder: (context,index)=>  const SizedBox(height: 20.0,),
              itemCount: alaaek.length);
          }
          else{
            return  Center(
              child: Text('error'),
            );
          }
      },)
    );
      },
    );
  }
  Widget alekaItem(AlekaModel alekaModel)=>Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              height: 130.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(top: 15.0,left: 40),
                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("${alekaModel.ingredients![0]} ",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        SizedBox(height: 2.0,),
                        Text("${alekaModel.ingredients![1]}",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        SizedBox(height: 2.0,),
                        Text("${alekaModel.ingredients![2]}",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                      ],
                    ),
                  )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0,right: 15),
                        child: Text(" ${alekaModel.alekaName}",style: TextStyle(fontSize: 22.0,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 5.0,),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          width: 150,
                          height: 30.0,
                          child: Center(child: Text( "السعر :"+ "${alekaModel.alekaPrice} جنيه",style: TextStyle(fontSize: 20.0,color: Colors.black),)),
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(20),
                            color:Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                color:defColorApp,
              ),
            );
            
}
