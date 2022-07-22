import 'package:carrot_market/repository/contents_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import "package:intl/intl.dart";

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  String currentLocation = "ara";
  ContentRepository contentRepository = ContentRepository();
  final Map<String, String> locationTypeToString = {
    "ara": "아라동",
    "ora": "오라동",
    "donam": "도남동"
  };

  @override
  void initState() {
    super.initState();
    currentLocation = "ara";
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }

  PreferredSizeWidget _appbarWidget(){
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: GestureDetector(
          onTap: (){
            print("click");
          },
          onLongPress: (){
            print("Long Press!!");
          },
          child: PopupMenuButton<String>(
            offset: Offset(-10, 25),
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              1
            ),
            onSelected: (String value) {
              print(value);
              setState(() {
                currentLocation = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "ara",
                  child: Text("아라동"),
                ),
                PopupMenuItem(
                  value: "ora",
                  child: Text("오라동"),
                ),
                PopupMenuItem(
                  value: "donam",
                  child: Text("도남동"),
                )
              ];
            },
            child: Row(
              children: [
                Text(
                  locationTypeToString[currentLocation]!,
                  style: TextStyle(color: Colors.black),
                  ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: (){

                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black
                )
              ),
              IconButton(
                onPressed: (){

                }, 
                icon: Icon(
                  Icons.tune,
                  color: Colors.black
                )
              ),
              IconButton(
                onPressed: (){

                }, 
                icon: SvgPicture.asset(
                  "assets/svg/bell.svg",
                  width: 23,
                )
              )
            ],
          )
        ],
      );
  }
  
  _loadContents(){
    return contentRepository.loadContentsFromLocation(currentLocation);
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString){
    if (priceString == "무료나눔"){
      return priceString;
    }
    return "${oCcy.format(int.parse(priceString))}원";
  }

  _makeDataList(List<Map<String, String>> datas){
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    datas[index]["image"]!,
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          datas[index]["title"]!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          datas[index]["location"]!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.3)
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          calcStringToWon(datas[index]["price"]!),
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/svg/heart_off.svg",
                                  width: 13,
                                  height: 13,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(datas[index]["likes"]!),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }, 
      separatorBuilder: (BuildContext context, int index){
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.4)
        );
      }, 
      itemCount: datas.length,
    );
  }

  Widget _bodyWidget(){
    return FutureBuilder(
      future: _loadContents(),
      builder: (BuildContext context, dynamic snapshot){
        if (snapshot.connectionState != ConnectionState.done){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData){
          return _makeDataList(snapshot.data);
        }

        return Center(
          child: Text("해당 지역에 데이터가 없습니다."),
        );
        
      },
    );
  }
}

