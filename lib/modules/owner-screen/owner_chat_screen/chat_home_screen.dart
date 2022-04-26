


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';


import '../../../models/user_model.dart';
import '../../../shared/component/components.dart';

import 'chat_details_screen.dart';

class OwnerChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit, OwnerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildChatItem(OwnerCubit.get(context).users[index],context,),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: OwnerCubit.get(context).users.length);
        // return ConditionalBuilder(
        //     condition:  SocialCubit.get(context).user.length>0,
        //     builder: (context)=>ListView.separated(
        //         physics: BouncingScrollPhysics(),
        //         scrollDirection: Axis.vertical,
        //         itemBuilder: (context, index) => buildChatItem(SocialCubit.get(context).user[index],context,),
        //         separatorBuilder: (context, index) => myDivider(),
        //         itemCount: SocialCubit.get(context).user.length),
        //     fallback: (context)=>Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget buildChatItem(UserModel model,context) => InkWell(
    onTap: () {
      navigateTo(context, OwnerChatDetailsScreen( userModel: model,));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                '${model.image}'
            ),
            radius: 20.0,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            '${model.name}',
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    ),
  );
}
