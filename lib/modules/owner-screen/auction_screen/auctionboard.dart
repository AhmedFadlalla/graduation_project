import 'package:custom_check_box/custom_check_box.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

import '../../../shared/component/components.dart';

class AuctionBoard extends StatelessWidget {
  ////////////////////////////////
  var Bidding = TextEditingController();

  ////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit, OwnerState> //1
        (
      listener: (BuildContext context, state) {}, //1
      builder: (BuildContext context, state) //rebuilder//1
          {
        return Scaffold(


          body:


          Directionality(textDirection: TextDirection.rtl,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Material(
                      elevation: 22.0,
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                          child: CountDownText(
                            due: DateTime.parse("2022-05-05 00:00:00"),
                            finishedText: "Done",
                            showLabel: true,
                            longDateName: true,
                            daysTextLong: "DAYS - ",
                            hoursTextLong: " HOURS - ",
                            minutesTextLong: " MINUTES - ",
                            secondsTextLong: " SECONDS ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                          boxShadow: const [
                            BoxShadow(color: Colors.white, spreadRadius: 1.0),
                          ],
                        ),
                      ),
                    ),
                  ),


                 SizedBox(height: 10.0,),


///////////////////////card////////////////////////////////////////////////
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left:5 ,
                        right:5 ,
                      ),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  elevation: 16.0,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(12.0) ,
                                  ),
                                  child: InkWell(
                                    onTap: (){},
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        // const Image(
                                        //   image: NetworkImage(
                                        //     'https://previews.123rf.com/images/chalabala/chalabala1708/chalabala170800033/83875705-medicina-veterinaria-en-la-finca-veterinario-durante-el-examen-m%C3%A9dico-de-los-caballos-en-el-establo-.jpg',
                                        //   ),
                                        //   width: double.infinity,
                                        //   height: 150.0,
                                        //   fit: /BoxFit.fitWidth,
                                        // ),

                                        Card(
                                          elevation: 22.0,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.bottomCenter,
                                                children: [
                                                  Image(
                                                    image: NetworkImage(
                                                      'data:image/jpeg;base64,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',
                                                    ),
                                                    width: double.infinity,
                                                    height: 250.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

//////////////////////////////////////////////////////////////////////////////////////////
                                        Padding(
                                          padding:  EdgeInsets.only(
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:  [
                                                  Text(
                                                    ' الحد الأدني للمزايدة :',
                                                    style: TextStyle(fontSize: 22.0),
                                                  ),

                                                  Text(
                                                    ' السعر الافتتاحي :',
                                                    style: TextStyle(fontSize: 22.0),
                                                  ),

                                                  Text(
                                                    ' السعر الحالي :',
                                                    style: TextStyle(fontSize: 22.0),
                                                  ),

                                                  Row(
                                                    children: [

                                                      Text(
                                                        ' التأمين :',
                                                        style: TextStyle(fontSize: 22.0),
                                                      ),
                                                      Expanded(child: SizedBox()),
                                                      SizedBox(

                                                        height:33 ,
                                                        child: TextButton(
                                                          onPressed: (){},
                                                          child: Text('vodafone cash',
                                                            style: TextStyle(
                                                              fontSize: 22.0,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      ),


                                                    ],
                                                  ),

                                                  /////////////////////////////////////
                                                  Row(
                                                    children: [


                                                      TextButton(
                                                        onPressed: (){
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) => Padding(
                                                              padding: const EdgeInsets.only(
                                                                right: 5,
                                                                left: 5,
                                                              ),
                                                              child: SingleChildScrollView(
                                                                child: AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                  ),
                                                                  title: Center(
                                                                    child: Text(
                                                                      'شروط المشاركة بالمزادالتسجيل بموقع المزاد الالكتروني حسب التعليمات السابقة -  تأكيد بيانات الحساب الشخصي حسب التعليمات السابقة -3سداد تأمين دخول المزايد بقيمة 5000 خمسة الاف جنيه  باستخدام قنوات السداد المتاحة - الالمام بجميع الانظمة والتعلميات الحكومية المتعلقة بعمليات المزاد وتنفيذها ومنها نظام المرور ولائحته التنفيذية وجميع التعليمات المتعلقة به',
                                                                      style: TextStyle(
                                                                        fontSize: 22.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  backgroundColor: Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Text('الشروط والاحكام',
                                                          style: TextStyle(
                                                            fontSize: 22.0,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),



                                                      CustomCheckBox(
                                                        value: OwnerCubit.get(context).shouldCheck,
                                                        shouldShowBorder: true,
                                                        borderColor: Colors.red,
                                                        checkedFillColor: Colors.red,
                                                        borderRadius: 8,
                                                        borderWidth: 1,
                                                        checkBoxSize: 25,
                                                        onChanged: OwnerCubit.get(context).Check_Box,
                                                      ),

                                                          Expanded(child: SizedBox()),



                                                    ],
                                                  ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                                                  TextButton(
                                                    onPressed: (){
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) => Padding(
                                                          padding: const EdgeInsets.only(
                                                            right: 5,
                                                            left: 5,
                                                          ),
                                                          child: SingleChildScrollView(
                                                            child: AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(20.0),
                                                              ),
                                                              title: Center(
                                                                child: Text(
                                                                  'ggggggggggggg',
                                                                  style: TextStyle(
                                                                    fontSize: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              backgroundColor: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Text('بيانات الحصان ',
                                                      style: TextStyle(
                                                        fontSize: 22.0,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),

                                                  Row(
                                                    children: [


                                                      Expanded(
                                                        child: Directionality(
                                                          textDirection: TextDirection.rtl,
                                                          child: defaultFormField(

                                                              controller: Bidding,
                                                              type: TextInputType.text,
                                                              validator: (value) {
                                                                if (value.isEmpty) {
                                                                  return 'يجب ادخال البيانات ';
                                                                }
                                                              },
                                                              label: 'ادخل سعر المزايدة',
                                                              prefixIcon: Icons.medical_services),
                                                        ),
                                                      ),

                                                  SizedBox(height: 10,),

                                                      SizedBox(
                                                        width: 200,
                                                        height:55 ,
                                                        child: Card(
                                                          elevation: 16.0,
                                                          clipBehavior: Clip.antiAlias,
                                                          color:Colors.black,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:BorderRadius.circular(20.0)

                                                          ),
                                                          child: TextButton(
                                                            onPressed: (){},
                                                            child: Text('Bid',
                                                              style: TextStyle(
                                                                fontSize: 25.0,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),


                                                ],
                                              ), // <Widget>[]
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0,),

                                        Material(
                                          //elevation: 22.0,
                                          child: Container(
                                            //  width: double.infinity,
                                            height: 40,
                                            child: Center(
                                              child: CountDownText(
                                                due: DateTime.parse("2022-05-05 00:00:00"),
                                                finishedText: "Done",
                                                showLabel: true,
                                                longDateName: true,
                                                daysTextLong: "DAYS - ",
                                                hoursTextLong: " HOURS - ",
                                                minutesTextLong: " MINUTES - ",
                                                secondsTextLong: " SECONDS ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            decoration: const BoxDecoration(

                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              color: Colors.black,
                                              boxShadow: [
                                                BoxShadow(color: Colors.white, spreadRadius: 1.0),

                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
/////////////////////////////////////////////
                        separatorBuilder: (context, index) =>SizedBox(height:0,),


                        itemCount: 10,
                      ),
                    ),
                  ),
                ////////////////////////////////////////////////////////////





                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
