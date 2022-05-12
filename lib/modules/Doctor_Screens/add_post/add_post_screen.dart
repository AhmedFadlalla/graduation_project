import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';

import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icon_broken.dart';

class DocAddPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var postController = TextEditingController();
        var now = DateTime.now();
        return Scaffold(
            appBar: AppBar(
              title: Text('Create Post'),
              actions: [
                TextButton(
                    onPressed: () {
                      if (DoctorCubit.get(context).postImage == null) {
                        DoctorCubit.get(context).createPost(
                            dateTime: now.toString(),
                            text: postController.text);
                      }
                      else{
                        DoctorCubit.get(context).uploadPostImage(
                            dateTime: now.toString(),
                            text: postController.text
                        );
                      }
                    },
                    child: Text('POST'))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if(state is DocCreatePostLoadingState)
                    LinearProgressIndicator(),
                  if(state is DocCreatePostLoadingState)
                    SizedBox(
                      height: 8.0,
                    ),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                            '${DoctorCubit.get(context).doctorModel!.image}'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${DoctorCubit.get(context).doctorModel!.name}',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            '${DateTime.now()}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: postController,
                    decoration: InputDecoration(
                        hintText: 'What is on your mind....',
                        border: InputBorder.none),
                  )),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(DoctorCubit.get(context).postImage!=null)
                   Stack(
                    children: [
                      Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image: DecorationImage(
                              image: FileImage(DoctorCubit.get(context).postImage!),
                              fit: BoxFit.cover,
                            )),
                      ),
                      IconButton(
                          onPressed: (){
                            DoctorCubit.get(context).removePostImage();

                          },
                          icon: CircleAvatar(
                            radius: 20.0,
                            child: Icon(
                              Icons.close,
                              size: 16.0,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              DoctorCubit.get(context).getPostImage();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconBroken.Image),
                                Text(
                                  'Add Photo',
                                  style: TextStyle(color: defaultColor),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '#tags',
                            style: TextStyle(color: defaultColor),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
