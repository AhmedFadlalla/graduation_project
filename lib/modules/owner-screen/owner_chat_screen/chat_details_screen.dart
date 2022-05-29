
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';

import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../models/Message_model.dart';
import '../../../shared/styles/icon_broken.dart';

class OwnerChatDetailsScreen extends StatelessWidget {
  UserModel userModel;
  OwnerChatDetailsScreen({required this.userModel});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {

        OwnerCubit.get(context)
            .getMessages(
            receiverId: userModel.uId);
        return BlocConsumer<OwnerCubit,OwnerState>(
          listener: (context,state){},
          builder: (context,state){
            var messageController=TextEditingController();
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage:NetworkImage(userModel.image),
                    ),
                    SizedBox(
                      width:6.0,
                    ),
                    Text(userModel.name,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),),

                  ],
                ),
                actions: [

                  IconButton(onPressed:( ){

                  },
                      icon: Icon(IconBroken.Info_Circle))
                ],
              ),
              body: ConditionalBuilder(
                  condition: OwnerCubit.get(context).messages.length>0,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [

                        Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context,index){
                                var message=OwnerCubit.get(context).messages[index];
                                if(OwnerCubit.get(context).userModel!.uId==message.senderId)
                                  return buildMyMessages(message);
                                return buildMessages(message);
                              },
                              separatorBuilder: (context,index)=>SizedBox(
                                height: 15.0,
                              ),
                              itemCount: OwnerCubit.get(context).messages.length),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1.0
                              ),
                              borderRadius:BorderRadius.circular(15.0)

                          ),
                          clipBehavior:Clip.antiAliasWithSaveLayer ,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,

                                      hintText: 'type your message here........'
                                  ),
                                  controller: messageController,
                                  style: TextStyle(color:  Colors.black,),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                color: defaultColor,
                                child: MaterialButton(
                                  onPressed: (){

                                    OwnerCubit.get(context).sendMessage(
                                        receiverId: userModel.uId,
                                        text: messageController.text,
                                        dateTime: DateTime.now().toString());

                                  },
                                  minWidth: 1.0,


                                  child: Icon(
                                    IconBroken.Send,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  fallback:(context)=>Center(child: Column(
                    children: [

                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1.0
                            ),
                            borderRadius:BorderRadius.circular(15.0)

                        ),
                        clipBehavior:Clip.antiAliasWithSaveLayer ,
                        child: Row(
                          children: [

                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,

                                    hintText: 'type your message here........'
                                ),
                                controller: messageController,
                                style: TextStyle(color:  Colors.black,),
                              ),
                            ),
                            Container(
                              height: 50.0,
                              color: defaultColor,
                              child: MaterialButton(
                                onPressed: (){

                                  DoctorCubit.get(context).sendMessage(
                                      receiverId: userModel.uId,
                                      text: messageController.text,
                                      dateTime: DateTime.now().toString());

                                },
                                minWidth: 1.0,


                                child: Icon(
                                  IconBroken.Send,
                                  color: Colors.white,
                                  size: 16.0,
                                ),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),)),

            );
          },
        );
      },

    );


  }
  Widget buildMessages(MessageModel model)=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd:Radius.circular(10.0) ,
                topStart:Radius.circular(10.0),
                topEnd:Radius.circular(10.0))
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0
        ),
        child:
        Text('${model.text}')),
  );
  Widget buildMyMessages(MessageModel model)=>Align(
    alignment:AlignmentDirectional.centerEnd,
    child: Container(
      width: 150.0,
        height: 50.0,
        decoration: BoxDecoration(
            color:defaultColor.withOpacity(0.2),
            borderRadius: BorderRadiusDirectional.only(
                topStart:Radius.circular(10.0),
                topEnd:Radius.circular(10.0) ,
                bottomEnd:Radius.circular(10.0)
            )
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0
        ),
        child:Text(
            '${model.text}',
          style: TextStyle(
            fontSize: 15.0
          ),
        )
    ),
  );
}