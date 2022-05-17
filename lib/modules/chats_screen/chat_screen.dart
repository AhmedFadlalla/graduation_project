import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/cubit.dart';
import 'package:graduation_project/layouts/home_layout/cubit/states.dart';
import 'package:graduation_project/modules/chats_screen/chat_screen_details.dart';
import '../../../models/user_model.dart';
import '../../../shared/component/components.dart';

class UserChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HorseCubit, HorseStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildChatItem(
              HorseCubit.get(context).users[index],
              context,
            ),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: HorseCubit.get(context).users.length);
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

  Widget buildChatItem(UserModel model, context) => InkWell(
    onTap: () {
      navigateTo(
          context,
          ChatDetailsScreen(
            userModel: model,
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('${model.image}'),
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
