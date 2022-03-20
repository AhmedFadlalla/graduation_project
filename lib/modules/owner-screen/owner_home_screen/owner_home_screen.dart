import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/modules/owner-screen/accomm_scree/add_accomm_screen/add_accomm_screen.dart';
import 'package:graduation_project/shared/component/components.dart';

import '../Horses_screen/horses_screen.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          final List<String>imagelist=[
            'https://static.vecteezy.com/system/resources/previews/002/238/384/original/portrait-of-an-arabian-horse-head-on-a-black-background-illustration-vector.jpg',
            'https://static.vecteezy.com/system/resources/previews/002/238/384/original/portrait-of-an-arabian-horse-head-on-a-black-background-illustration-vector.jpg',
            'https://static.vecteezy.com/system/resources/previews/002/238/384/original/portrait-of-an-arabian-horse-head-on-a-black-background-illustration-vector.jpg',
            'https://static.vecteezy.com/system/resources/previews/002/238/384/original/portrait-of-an-arabian-horse-head-on-a-black-background-illustration-vector.jpg',


          ];
          double height =MediaQuery.of(context).size.height;
          var cubit=OwnerCubit.get(context);
          return SafeArea(

            child: SingleChildScrollView(
              child: Column(

                children: [
                  SizedBox(
                    height: height*0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Text(
                        'Welcome ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      )
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child:CircularProfileAvatar(
                      //     'https://st2.depositphotos.com/3646177/7020/v/380/depositphotos_70207809-stock-illustration-horse-logo.jpg?forcejpeg=true',
                      //     borderColor: Colors.black,
                      //     borderWidth: 0,
                      //     elevation: 22,
                      //     radius: 120,
                      //   ),
                      // )

                    ],
                  ),
                  SizedBox(
                    height: height*0.01,
                  ),



                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: TestCard(
                                title: 'Horse ',
                                image: 'https://img.equinenow.com/slir/w800/equine/data/photos/1350049/1609624625/few-white-hairs-on-forehead-horse.jpg',

                              ),
                              onTap: (){
                                navigateTo(context, HorsesScreen());
                              },
                            ),
                          ),
                          SizedBox(width: 50.0,),

                          Expanded(
                            child: InkWell(
                              child: TestCard(
                                title: 'Doctor ',
                                image: 'https://th.bing.com/th/id/OIP.6kPQxkyTkPZ8Vf1Bh4HnMwHaE8?pid=ImgDet&rs=1',

                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                  //////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: TestCard(
                              title: 'Auction ',
                              image: 'https://th.bing.com/th/id/R.ae628746bfbab21425bd926faced8c32?rik=z9w7a6vB7MpcGw&riu=http%3a%2f%2fwww.irishnews.com%2fpicturesarchive%2firishnews%2firishnews%2f2019%2f05%2f22%2f163509791-8afe60e5-8411-4817-bc81-e5da163ae568.jpg&ehk=hPd%2bbofRZrUEgzq1EDAvovtAXoP%2fhIfgCct7QV%2bqkjc%3d&risl=&pid=ImgRaw&r=0',

                            ),
                          ),
                          SizedBox(width: 40.0,),
                          Expanded(
                            child: InkWell(
                              child: TestCard(
                                title: 'Accommodation',
                                image: 'https://i0.wp.com/anexpatabroad.com/wp-content/uploads/2016/11/img_8649-2.jpg?fit=600%2C584&ssl=1',


                              ),
                              onTap: (){
                                navigateTo(context, AddAccommindationScreen());
                              },
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),

                  /////////////////////////////
                  Center(
                    child: SizedBox(
                      width:500 ,
                      height:220 ,
                      child: CarouselSlider(

                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          // autoPlayAnimationDuration: Duration(milliseconds: 500),
                        ),

                        items:imagelist.map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(
                                e,

                                fit: BoxFit.cover,
                              )

                            ],
                          ),

                        )).toList(),



                      ),
                    ),
                  ),



                ],
              ),
            ),
          );

        },
        listener : (context,state){});
  }
  Widget TestCard({

    String? title,
    //String image = 'https://www.photosmix.com/wp-content/uploads/2020/02/%D8%B5%D9%88%D8%B1-%D8%AC%D9%85%D9%8A%D9%84%D8%A9-%D8%AC%D8%AF%D8%A7-2020-%D8%B5%D9%88%D8%B1-%D8%AC%D9%85%D9%8A%D9%84%D8%A9-%D9%85%D9%83%D8%AA%D9%88%D8%A8-%D8%B9%D9%84%D9%8A%D9%87%D8%A7-%D9%83%D9%84%D8%A7%D9%85-%D8%AD%D9%84%D9%88-%D8%A7%D9%83%D8%AB%D8%B1-%D9%85%D9%86-100-%D8%B5%D9%88%D8%B1%D8%A9-%D8%AC%D8%AF%D9%8A%D8%AF%D8%A9-2.jpg',
    String image ='https://static.vecteezy.com/system/resources/previews/002/238/384/original/portrait-of-an-arabian-horse-head-on-a-black-background-illustration-vector.jpg',

  }) =>
      SizedBox(
        // width:50 ,
        // height:200 ,
        child: Card(
          elevation: 22.0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(

            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                      image,
                    ),
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                    padding: EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),

                    width: double.infinity,
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],

          ),
        ),
      );
}
