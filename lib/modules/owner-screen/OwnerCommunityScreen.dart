import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/cubit.dart';
import 'package:graduation_project/layouts/home_layout/cubit/states.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/models/post_model.dart';
import 'package:graduation_project/modules/owner-screen/add_post/add_post_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:graduation_project/shared/styles/icon_broken.dart';

class OwnerCommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit,OwnerState>(
      listenWhen: (previous, current) {
        return true;
      },
      listener: (context,state){},
      builder: (context,state){
        double size=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size*0.04,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 390.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                          NetworkImage(OwnerCubit.get(context).ownerModel?.image==null?
                              'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'
                              :OwnerCubit.get(context).ownerModel!.image
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        InkWell(
                          child: Container(
                            height: 20,
                            width: width*0.8,
                            child: Text('What\s on your mind?'),


                          ),
                          onTap: (){

                            navigateTo(context, AddPostScreen());

                          },
                        )
                      ],
                    ),
                  ),
                ),
                ConditionalBuilder(
                  condition: OwnerCubit.get(context).posts.length >0,
                  builder:(context)=>SingleChildScrollView(
                    child: Column(
                      children: [
                        // Container(
                        //   width: double.infinity,
                        //   height: 170.0,
                        //   child: Card(
                        //     clipBehavior: Clip.antiAliasWithSaveLayer,
                        //     elevation: 20.0,
                        //     child: Image(
                        //       image: NetworkImage('https://cdn.pixabay.com/photo/2017/03/30/10/59/social-networking-2187996_960_720.jpg'),
                        //       fit: BoxFit.cover,
                        //       height: 150.0,
                        //     ),
                        //   ),
                        // ),
                        ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context,index)=>buildPostItem(OwnerCubit.get(context).posts[index],context,index),
                            separatorBuilder: (context,index)=>myDivider(),
                            itemCount:OwnerCubit.get(context).posts.length ),


                        // SocialCubit.get(context).posts.length
                      ],
                    ),
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator()),

                ),
              ],
            ),
          );
        // Image(image: AssetImage('assets/images/travel.jpg')

      },
    );
  }


  Widget buildPostItem(PostModel model,BuildContext context,index)=>Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 10.0,

    margin: EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage:
                NetworkImage(
                    '${model.image}'
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${model.name}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            height: 1.4,

                          ),),
                        SizedBox(
                          width: 4.0,
                        ),
                        Icon(

                          Icons.check_circle,
                          color:  defaultColor,
                          size: 16.0,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                        '${model.dateTime}',
                        style: Theme.of(context).textTheme.caption!.copyWith(

                          height: 1.4,
                        )
                    )
                  ],

                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,

                ),
                onPressed: (){},
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0
            ),
            child: myDivider(),
          ),
          Text(
            '${model.text}',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.black
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       bottom: 10.0,
          //       top: 5.0
          //   ),
          //   child: Container(
          //     width: double.infinity,
          //     child: Wrap(
          //       children: [
          //         Container(
          //           child: MaterialButton(
          //               onPressed: (){},
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               child: Text('#flutter'
          //                 ,style:TextStyle(
          //                     color: defaultColor
          //                 ),)),
          //           height: 20.0,
          //         ),
          //         Container(
          //           child: MaterialButton(
          //               onPressed: (){},
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               child: Text('#Software'
          //                 ,style:TextStyle(
          //                     color: defaultColor
          //                 ),)),
          //           height: 20.0,
          //         ),
          //         Container(
          //           child: MaterialButton(
          //               onPressed: (){},
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               child: Text('#Software'
          //                 ,style:TextStyle(
          //                     color: defaultColor
          //                 ),)),
          //           height: 20.0,
          //         ),
          //         Container(
          //           child: MaterialButton(
          //               onPressed: (){},
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               child: Text('#Software'
          //                 ,style:TextStyle(
          //                     color: defaultColor
          //                 ),)),
          //           height: 20.0,
          //         ),
          //         Container(
          //           child: MaterialButton(
          //               onPressed: (){},
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               child: Text('#Software'
          //                 ,style:TextStyle(
          //                     color: defaultColor
          //                 ),)),
          //           height: 20.0,
          //         ),
          //       ],
          //
          //     ),
          //   ),
          // ),
          if(model.postImage != '')
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image:  NetworkImage(
                        '${model.postImage}'
                    ),
                    fit:BoxFit.cover ,

                  )
              ),
            ),
          if(model.postImage != '')
            SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0
                      ),
                      child: Row(

                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 16.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('${OwnerCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.grey
                            ),)
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            IconBroken.Chat,
                            size: 16.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('1200 comments',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.grey
                            ),)
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: myDivider(),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10.0,
                        backgroundImage:
                        NetworkImage(
                            '${OwnerCubit.get(context).ownerModel!.image}'
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Write a comment',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              InkWell(

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0
                  ),
                  child: Row(

                    children: [
                      Icon(
                        IconBroken.Heart,
                        size: 16.0,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Like',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey
                        ),)
                    ],
                  ),
                ),
                onTap: (){
                  // OwnerCubit.get(context).likePost(HorseCubit.get(context).postsId[index]);
                },
              )
            ],
          )


        ],
      ),
    ),
  );
}
