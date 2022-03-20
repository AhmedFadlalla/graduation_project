

import 'package:flutter/material.dart';
import 'package:graduation_project/modules/registeration_screen/login_screen/login_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/network/local/cach_helper.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  void submit(){
    navigateAndFinish(context,LoginScreen());
    CachHelper.saveData(key: 'onBoarding', value: true);
  }
  List<BoardingModel> boardItems = [
    BoardingModel(
        image: 'assets/images/arabianhorse.jpg',
        title: 'Arabian Horse',
        body: 'Enjoy with our horses of the purebred arabian '),
    BoardingModel(
        image: 'assets/images/travel.jpg',
        title: 'Travelling',
        body: 'Travel with own horse'),
    BoardingModel(
        image: 'assets/images/accommindation.jpg',
        title: 'Can I make accommodation ?',
        body: 'Suiiiiiiiii'),
  ];
 bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              text: 'SKIP',
              pressedFunction: (){
                submit();
              },)

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==boardItems.length-1){
                    setState(() {
                        isLast=true;
                    });
                  }
                  else{
                    setState(() {
                      isLast=false;
                    });
                  }

                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildItemBoard(boardItems[index]),
                itemCount: boardItems.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5.0,
                      activeDotColor: defaultColor,
                    ),
                    count: boardItems.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast){
                      submit();
                    }
                    else{
                      boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750 ,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }



                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemBoard(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      );
}
