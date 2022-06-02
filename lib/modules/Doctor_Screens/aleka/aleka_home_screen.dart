import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/Doctor_Screens/aleka/show.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import '../../../shared/component/components.dart';
import 'alka.dart';

class AlekaHomeScreen extends StatelessWidget {
  const AlekaHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDetails()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                width: double.infinity,
                height: 100.0,
                child: defaultbutton(
                    width:double.infinity,
                    background: defColorApp,
                    function:(){print("hello flutter");},
                    text:'العلائق',
                    size: 20.0
                ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AlCar()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                width: double.infinity,
                height: 100.0,
                child: defaultbutton(
                  width:double.infinity,
                  function:(){print("hello flutter");},
                  background: defColorApp,
                  text:'كون عليقة',
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
