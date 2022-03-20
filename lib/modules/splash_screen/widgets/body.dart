

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/modules/onboarding_screen/onboarding_screen.dart';
import 'package:graduation_project/shared/component/components.dart';

class SplashBodyView extends StatefulWidget {
  @override
  _SplashBodyViewState createState() => _SplashBodyViewState();
}

class _SplashBodyViewState extends State<SplashBodyView> with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation<double>? feedingAnimation;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync:this,duration: Duration(milliseconds: 600) );
    feedingAnimation =Tween<double>(begin: 0.2,end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }
  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Spacer(),
          FadeTransition(
            opacity: feedingAnimation!,
            child: Text(
              'Control your own Stud',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 51.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFffffff),
              ),

            ),
          ),

          Spacer(),

          Image.asset('assets/images/horse.jpeg'),
        ],
      ),
    );
  }

  void goToNextView() {

    Future.delayed(Duration(seconds: 3),()
    {
     navigateTo(context, OnBoardingScreen());
    });
  }
}
