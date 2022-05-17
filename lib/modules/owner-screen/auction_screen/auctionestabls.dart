import 'package:custom_check_box/custom_check_box.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../home_screen/home_screen.dart';
import 'auctionboard.dart';

class AuctionEstabls extends StatelessWidget {
  ////////////////////////////////
  var vaccineStartDate = TextEditingController();
  ////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit, OwnerState> //1
        (
      listener: (BuildContext context, state) {}, //1
      builder: (BuildContext context, state) //rebuilder//1
          {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),


///////////////////////card////////////////////////////////////////////////
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){ Navigator.push(
                          context, //my place
                          MaterialPageRoute(
                            builder: (context) => AuctionBoard(),
                          ),
                          /////اللي انا رايحله
                        );},
                        child: Center(
                          child: buildImageInteractionCard(
                            image:  'https://secure.img1-fg.wfcdn.com/im/78261091/resize-h600-w600%5Ecompr-r85/1658/16584404/A+Horse+of+Many+Colors+Wall+Sticker.jpg',


                            title: 'مزاد محطة الزهراء - عين شمس  ',
                          ),
                        ),
                      ),
/////////////////////////////////////////////
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),

                      itemCount: 10,
                    ),
                  ),
                ),
                ////////////////////////////////////////////////////////////


              ],
            ),
          ),
        );
      },
    );
  }
}
