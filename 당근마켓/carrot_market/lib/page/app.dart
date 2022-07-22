import 'package:flutter/material.dart';
import 'package:carrot_market/page/home.dart';
import 'package:flutter_svg/svg.dart';
import "package:intl/intl.dart";

class APP extends StatefulWidget {
  APP({Key? key}) : super(key: key);

  @override
  _APPState createState() => _APPState();
}

class _APPState extends State<APP> {

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString){
    return "${oCcy.format(int.parse(priceString))}원";
  }

  Widget _bodyWidget(){
    switch(_currentPageIndex){
      case 0:
        return Home();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
    }
    return Container();
  }

  BottomNavigationBarItem _bottomNavigationBar(String IconName, String label){
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: SvgPicture.asset(
          'assets/svg/${IconName}_off.svg',
          width: 22
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: SvgPicture.asset(
          'assets/svg/${IconName}_on.svg',
          width: 22
        ),
      ),
      label: label
    );
  }

  Widget _bottomNavigationBarWidget(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      onTap: (int index){
        print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      items: [
        _bottomNavigationBar("home", "홈"),
        _bottomNavigationBar("notes", "동네 생활"),
        _bottomNavigationBar("location", "내 근처"),
        _bottomNavigationBar("chat", "채팅"),
        _bottomNavigationBar("user", "나의 당근")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}