import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ManorTemperature extends StatelessWidget {

  double manorTemp;
  int? level;

  ManorTemperature({Key? key, required this.manorTemp}){
    _calcTempLevel();
  }

  final List<Color> tempPerColors = [
    Color(0xff072038),
    Color(0xff0d3a65),
    Color(0xff186ec0),
    Color(0xff37b24d),
    Color(0xffffad13),
    Color(0xfff76707),
  ];

  void _calcTempLevel(){
    if(manorTemp <= 20){
      level = 0;
    }
    else if(manorTemp <= 32){
      level = 1;
    }
    else if(manorTemp <= 36.5){
      level = 2;
    }
    else if(manorTemp <= 40){
      level = 3;
    }
    else if(manorTemp <= 50){
      level = 4;
    }
    else{
      level = 5;
    }
  }

  Widget _makeTempLabelAndBar(){
    return Container(
      width: 62,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$manorTemp°C",
            style: TextStyle(
              color: tempPerColors[level!],
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 6,
              color: Colors.black.withOpacity(0.2),
              child: Row(
                children: [
                  Container(
                    height: 6,
                    width: 62 / 99 * manorTemp,
                    color: tempPerColors[level!],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _makeTempLabelAndBar(),
            Container(
              margin: const EdgeInsets.only(left: 7),
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/images/level-$level.jpeg"
              ),
            )
          ],
        ),
        Text(
          "매너온도", 
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 12,
            color: Colors.grey
          ), 
        )
      ],
    );
  }
}