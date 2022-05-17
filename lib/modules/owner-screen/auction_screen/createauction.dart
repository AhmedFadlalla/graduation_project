
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../../shared/component/components.dart';

class CreateAuction extends StatelessWidget {

  var MinimumBidding = TextEditingController();
  var OpenningPrice = TextEditingController();
  var InsurancePrice = TextEditingController();
  var AuctionDate = TextEditingController();
  var Conditions = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit, OwnerState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [


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
                                      'https://thumbs.dreamstime.com/b/auction-realistic-neon-sign-brick-wall-background-d-rendered-royalty-free-stock-image-can-be-used-online-banner-ads-86491900.jpg',
                                    ),
                                    width: double.infinity,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: MinimumBidding,
                              type: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'الحد الأدني للمزايدة',
                              prefixIcon: Icons.monetization_on_outlined),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: OpenningPrice,
                              type: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'السعر الأفتتاحي',
                              prefixIcon: Icons.monetization_on_outlined),
                        ),




                        SizedBox(
                          height: 15,
                        ),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: InsurancePrice,
                              type: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'مبلغ التأمين',
                              prefixIcon: Icons.monetization_on_outlined),
                        ),


                        SizedBox(
                          height: 15,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: AuctionDate,
                              type: TextInputType.datetime,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'تاريخ المزاد',
                              prefixIcon: Icons.date_range),
                        ),



                        SizedBox(
                          height: 15,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: Conditions,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'الشروط والأحكام ',
                              prefixIcon: Icons.account_balance_rounded),
                        ),


                        SizedBox(
                          height: 15,
                        ),

                        defaultButton2(
                            function: () {},
                            text: 'Save',
                            background: Colors.black,
                            height: 50.0,
                            width: 200.0
                        ),




                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
