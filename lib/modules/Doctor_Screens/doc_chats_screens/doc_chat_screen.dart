import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import '../../../models/user_model.dart';
import '../../../shared/component/components.dart';
import 'doc_chat_screen_details.dart';

class DocChatScreen extends StatelessWidget {
  const DocChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildChatItem(DoctorCubit.get(context).users[index],context,),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: DoctorCubit.get(context).users.length);
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
      navigateTo(context, DocChatScreenDetails( userModel: model,));
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
