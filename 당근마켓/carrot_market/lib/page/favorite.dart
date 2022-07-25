import 'package:carrot_market/page/detail.dart';
import 'package:carrot_market/repository/contents_repository.dart';
import 'package:carrot_market/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFavoriteContents extends StatefulWidget {
  MyFavoriteContents({Key? key}) : super(key: key);

  @override
  State<MyFavoriteContents> createState() => _MyFavoriteContentsState();
}

class _MyFavoriteContentsState extends State<MyFavoriteContents> {

  ContentRepository contentRepository = ContentRepository();

  @override
  void initState(){
    super.initState();
    print("Init");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget()
    );
  }

  PreferredSizeWidget _appbarWidget(){
    return AppBar(
      title: Text(
        "관심목록",
        style: TextStyle(
          fontSize: 15
        ),
      ),
    );
  }

  Widget _bodyWidget(){
    return FutureBuilder(
      future: _loadMyFavoriteContents(),
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

  Future<List<dynamic>?> _loadMyFavoriteContents() async{
    return await contentRepository.loadFavoriteContents();
  }

  _makeDataList(List<dynamic> datas){
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return DetailContentView(data:Map<String,String>.from(datas[index]));
                  },
                )
              ).then((value) => setState((() {})));
              print(datas[index]["title"]);
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Hero(
                      tag: datas[index]["cid"]!, 
                      child: Image.asset(
                        datas[index]["image"]!,
                        width: 100,
                        height: 100,
                      ),
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
                            DataUtils.calcStringToWon(datas[index]["price"]!),
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

}