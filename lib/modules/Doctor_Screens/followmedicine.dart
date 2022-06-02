
import 'package:flutter/cupertino.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';

import '../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../models/roshetamodel.dart';

class FollowMedicine extends StatefulWidget {
  List<DiseaseModel> mydata;
  FollowMedicine(this.mydata);
  @override
  _FollowMedicine createState() => _FollowMedicine();

}
class _FollowMedicine extends State<FollowMedicine>{
  // var diseaseDate = TextEditingController();
  // var disease = TextEditingController();
  // var doctor = TextEditingController();
  // var diseaseState = TextEditingController();
@override void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context)
   {
    return BlocConsumer<DoctorCubit, DoctorStates>
      (
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state)
      {

      return Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(

            children:
            [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left:5 ,
                    right:5 ,
                  ),
                  child: ListView.separated(

                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        Material(
                      elevation: 22.0,
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        child:Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 5.0,),
                              Icon(
                                Icons.vaccines,
                                size: 35,
                              ),
                              SizedBox(width: 15.0,),
                              Expanded(
                                child: SizedBox(
                                  width: 330,

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start ,
                                    children:  [
                                      Text(
                                        // 'vaccine : ${vaccine}' ,
                                        'vaccine :${widget.mydata[index].vaccine} ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      SizedBox(height: 2.0,),
                                      Text(
                                         'date :${widget.mydata[index].vaccineDate}',
                                        // 'date : ${date}' ,
                                        style: TextStyle(

                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              CustomCheckBox(
                                value: DoctorCubit.get(context).shouldCheck,
                                shouldShowBorder: true,
                                borderColor: Colors.black54,
                                checkedFillColor: Colors.black54,
                                borderRadius: 8,
                                borderWidth: 1,
                                checkBoxSize: 25,
                                onChanged: DoctorCubit.get(context).Check_Box,
                              ),

                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.indigo,

                          boxShadow: const [
                            BoxShadow(color: Colors.white, spreadRadius: 1.0),
                          ],
                        ),


                      ),
                    ),
/////////////////////////////////////////////
                      separatorBuilder: (context, index) =>SizedBox(height:8,),


                    itemCount:widget.mydata.length,
                  ),
                ),
              ),



            ],
          ),
        ),
      );
      },
    );
  }
}