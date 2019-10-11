import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  bool _isExpaned = false;
  List<Widget> cards = List<Widget>();
  List<Widget> items = List<Widget>();
  List<Color> colorsBlue = [
    Color(0xff02DCAA),
    Color(0xff0075E0),
  ];

  List<Color> colorsRed = [
    Color(0xffFFA83A),
    Color(0xffFB3C54),
  ];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(cards.isEmpty){
      cards = [cardReds(1),cardBlues(2),cardReds(3),cardBlues(4),cardReds(5),cardReds(6)];
    }
    items = cards.take(4).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      "Portfolios",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: Colors.black
                      ),
                    ),
                  ),
        actions: <Widget>[
            FlatButton(
                    onPressed: (){},
                    child: Icon(
                      Icons.add_circle,
                      color: Color(0xff6025F8),
                    ),
                  ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _isExpaned = !_isExpaned;
                      });
                    },
                    child: AnimatedCrossFade(
                    firstChild: buildCollapse(items),
                    secondChild: buildExpand(items),
                    crossFadeState: !_isExpaned
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 250),
                    ),
                  )
        ),
      ),
    );
  }

  Widget buildCollapse(List<Widget> items){
    double marginTop = 0;
    double marginH = 48;
    return Stack(
    alignment: Alignment.topCenter,
    children: items.asMap().map((index, card){
      double marginLR = marginH -=12;
      return MapEntry(index, Container(
          margin: EdgeInsets.only(top: marginTop += 12,left: marginLR,right: marginLR),
          child: AnimatedSize(
            duration: Duration(seconds: 2),
            curve: Curves.easeOutSine,
            vsync: this,
            child: Dismissible(
              key: ValueKey(card),
              child: card,
              onDismissed: (_){
                setState(() {
                  cards.remove(card);
                  cards.insert(0, card);
                });
              },
            ),
          ),
        ));
        }).values.toList()
      );    
  }


  Widget buildExpand(List<Widget> items){
    return SingleChildScrollView(
      child: Column(
        children: items.reversed.toList()
      ),
    );
  }


  Widget cardReds(int number){
    return cardItem(
              leftTitle: "BINANCE ${number}",
              rightTitle: "EDIT",
              dollar: "13.506,72",
              bitcoin: "1.32",
              addPercent: "-0,87",
              addDollar: "-72,21",
              colors: colorsRed
            );
  }

  Widget cardBlues(int number){
    return   cardItem(
              leftTitle: "OVERRALL BALANCE ${number}",
              rightTitle: "",
              dollar: "23.748,42",
              bitcoin: "2,21",
              addPercent: "+0,87",
              addDollar: "+72,21",
              colors: colorsBlue
            );
  }

  Widget cardItem({List<Color> colors, String leftTitle, String rightTitle, String dollar, String bitcoin, String addPercent, String addDollar}){
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      width: size.width,
      height: size.height * (1/3.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.centerLeft,
          colors: colors
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 2,
            offset: Offset(5,3)
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 42),
            child: ImageIcon(
              AssetImage("assets/single_line.png"),
              color: Colors.white.withOpacity(0.6),
              size: size.width,
            ),
          ),
          Container(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16
                  ),
                ),
                Text(
                  rightTitle,
                  style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: dollar,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w900
                    )
                  ),
                  TextSpan(
                    text: "  \$",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                    )
                  )
                ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Row(
              children: <Widget>[
                   Text(
                    bitcoin,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  ImageIcon(
                    AssetImage("assets/bitcoin.png"),
                    color: Colors.white.withOpacity(0.85),
                    size: 14,
                  ),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Text(
                    "${addPercent}%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Text(
                    "${addDollar} \$",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
          )
        ],
      )
    );
  }


}