import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/owner-screen/doctor_screen/add_doc_screen.dart';
import 'package:graduation_project/shared/component/components.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateTo(context, AddDoctorScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
