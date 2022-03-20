import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

class HorseDetailsScreen extends StatelessWidget {
  const HorseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          var cubit=OwnerCubit.get(context);
      return Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height *0.01,
                  ),
                  Container(
                      padding: EdgeInsets.all(25),
                      child: Image(
                          image: NetworkImage(
                              '${cubit.horses[cubit.index].horseImage}'))),
                  Row(
                    children: [
                      Text(
                        'الاسم :',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${cubit.horses[cubit.index].horseName}',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'الاب :',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${cubit.horses[cubit.index].fatherName}',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'الام :',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${cubit.horses[cubit.index].motherName}',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'العنبر :',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${cubit.horses[cubit.index].sectionNum}',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'المايكروشيب :',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${cubit.horses[cubit.index].microshipCode}',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'السعر :',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${cubit.horses[cubit.index].initPrice}',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'تاريخ الميلاد :',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${cubit.horses[cubit.index].birthDate}',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
