import 'package:flutter/material.dart';
import 'package:tic_tac_toe1/utilities.dart';
import 'package:tic_tac_toe1/LengthPage.dart';
import 'package:tic_tac_toe1/weightPage.dart';
import 'package:tic_tac_toe1/tempPage.dart';
import 'package:tic_tac_toe1/timePage.dart';
import 'package:tic_tac_toe1/speedPage.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 63, 72),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height*0.1,),

            const Text('All IN ONE',style: TextStyle(
              fontSize: 60,
              color: Color.fromARGB(255, 248, 244, 26),
              fontWeight: FontWeight.bold,
            ),),

            const Text('CONVERTER ⏳',style: TextStyle(

              fontSize: 45,
              color: Color.fromARGB(255, 131, 255, 29),
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: size.height*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               unitBlock(const Color(0xff13b3d7), 'Length', size.width*0.35,size.width*0.39, context, const LengthPage()),



                unitBlock(const Color(0xffff3040), 'Weight', size.width*0.35,size.width*0.39, context, const weightPage()),
              ],
            ),

            SizedBox(height: size.height*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                unitBlock(const Color(0xfffd5d2d), 'Temperature', size.width*0.35,size.width*0.39, context, const tempPage()),

                unitBlock(const Color(0xffffb94d), 'Time', size.width*0.35,size.width*0.39, context, const timePage())
              ],
            ),

            SizedBox(height: size.height*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                unitBlock(const Color(0xffb620e1), 'Speed', size.width*0.35,size.width*0.39, context,const  speedPage()),

              ],
            ),
          ],
        ),
      ),
    );
  }
}