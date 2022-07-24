import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market/components/manor_temperature_widget.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {

  Size? size;
  List<String>? imgList;
  int? _current;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    imgList = [
      widget.data["image"]!,
      widget.data["image"]!,
      widget.data["image"]!,
      widget.data["image"]!,
      widget.data["image"]!,
    ];
    _current  = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true ,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }

  PreferredSizeWidget _appbarWidget(){
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          )
        ),
      actions: [
        IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.share),
          color: Colors.white,
        ),
        IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.more_vert),
          color: Colors.white,
        )
      ],
    );
  }

  Widget _bodyWidget(){

    return Column(
      children: [
        _makeSliderImage(),
        _sellerSimpleInfo()
      ],
    );
  }

  Widget _makeSliderImage(){
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: widget.data["cid"]!,
            child: CarouselSlider(
              items: imgList!.map((url){
                  return Image.asset(
                    url, 
                    width: size!.width,
                    fit: BoxFit.fill,
                  );
                }
              ).toList(),
              // carouselController: _controller,
              options: CarouselOptions(
                  height: size!.width,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList!.asMap().entries.map((entry) {
              return GestureDetector(
                // onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.white.withOpacity(0.4))
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _sellerSimpleInfo(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //     child: Image.asset(
          //       "assets/images/user.png"
          //     ),
          //   ),
          // )
          CircleAvatar(
            radius: 25,
            backgroundImage: Image.asset("assets/images/user.png").image,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "개발하는 남자",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),  
              ),
              Text(
                "제주시 도남동",
              ),
            ],
          ),
          Expanded(
            child: ManorTemperature(manorTemp: 37.5,)
          )
        ],
      ),
    );
  }

  Widget _bottomBarWidget(){
    return Container(
      width: size!.width,
      height: 55,
      color: Colors.red
    );
  }
}