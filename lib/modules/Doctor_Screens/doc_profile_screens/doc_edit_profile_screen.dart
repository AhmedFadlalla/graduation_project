import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../shared/component/components.dart';
import '../../../shared/styles/icon_broken.dart';

class DoctorEditProfileScreen extends StatelessWidget {
  const DoctorEditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var docModel = DoctorCubit.get(context).doctorModel;
        var profileImage = DoctorCubit.get(context).profileImage;
        var coverImage = DoctorCubit.get(context).coverImage;
        var nameController = TextEditingController();
        var phoneController = TextEditingController();
        var bioController = TextEditingController();
        var addressController = TextEditingController();

        if (docModel != null) {
          nameController.text = docModel.name;
          bioController.text = docModel.bio;
          phoneController.text = docModel.phone;
          addressController.text = docModel.address;
        }
        return Scaffold(
          appBar: AppBar(title: Text('Edit Profile'), actions: [
            defaultTextButton(
                text: 'UPDATE',
                pressedFunction: () {
                  DoctorCubit.get(context).updateDoctor(
                      docName: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text,
                    address:addressController.text
                  );
                }),
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is DoctorUpdateLoadingState)
                    LinearProgressIndicator(),
                  if (state is DoctorUpdateLoadingState)
                    SizedBox(
                      height: 10.0,
                    ),
                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Align(
                              child: Container(
                                height: 140.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0)),
                                    image: DecorationImage(
                                      image: coverImage == null
                                          ? NetworkImage('${docModel?.cover}')
                                          : FileImage(coverImage)
                                      as ImageProvider,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              alignment: AlignmentDirectional.topCenter,
                            ),
                            IconButton(
                                onPressed: () {
                                  DoctorCubit.get(context).getCoverImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65.0,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${docModel?.image}')
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  DoctorCubit.get(context).getProfileImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  if (DoctorCubit.get(context).profileImage != null ||
                      DoctorCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (DoctorCubit.get(context).profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                    function: () {
                                      DoctorCubit.get(context)
                                          .uploadProfileImage(
                                          docName: nameController.text,
                                          phone: phoneController.text,
                                          bio: bioController.text,
                                          address: addressController.text,
                                          context: context);
                                    },
                                    text: 'Upload Profile'),
                                if (state is DoctorUpdateLoadingState)
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is DoctorUpdateLoadingState)
                                  LinearProgressIndicator()
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 8.0,
                        ),
                        if (DoctorCubit.get(context).coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                    function: () {
                                      DoctorCubit.get(context).uploadCoverImage(
                                          docName: nameController.text,
                                          phone: phoneController.text,
                                          bio: bioController.text,
                                          address: addressController.text,
                                          context: context);
                                    },
                                    text: 'Upload Cover'),
                                if (state is DoctorUpdateLoadingState)
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is DoctorUpdateLoadingState)
                                  LinearProgressIndicator()
                              ],
                            ),
                          ),
                      ],
                    ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'name must not be empty';
                        }
                      },
                      label: 'Name',
                      prefixIcon: IconBroken.User),
                  SizedBox(
                    height: 5.0,
                  ),
                  defaultFormField(
                      controller: bioController,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'bio must not be empty';
                        }
                      },
                      label: 'Bio',
                      prefixIcon: IconBroken.Info_Circle),
                  SizedBox(
                    height: 5.0,
                  ),
                  defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'phone must not be empty';
                        }
                      },
                      label: 'Phone',
                      prefixIcon: IconBroken.Call),
                  SizedBox(
                    height: 5.0,
                  ),
                  defaultFormField(
                      controller: addressController,
                      type: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'address must not be empty';
                        }
                      },
                      label: 'address',
                      prefixIcon: IconBroken.Location),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
