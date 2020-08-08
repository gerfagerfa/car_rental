import 'package:flutter/material.dart';
import 'package:car_rental/constants.dart';
import 'package:car_rental/data.dart';

class Showroom extends StatefulWidget {
  @override
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;

  List<Deal> deals = getDealList();
  List<Dealer> dealers = getDealerList();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Car Rental App",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 28,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0, 
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.only(left: 30,),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 24.0, left: 16.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "TOP DEALS",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),

                        Row(
                          children: [

                            Text(
                              "view all",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),

                            SizedBox(
                              width: 8,
                            ),

                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: kPrimaryColor,
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),

                  Container(
                    height: 280,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: buildDeals(),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.all(24),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                "Available Cars",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              Text(
                                "Long term and short term",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),

                            ],
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "TOP DEALERS",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),

                        Row(
                          children: [

                            Text(
                              "view all",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),

                            SizedBox(
                              width: 8,
                            ),

                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: kPrimaryColor,
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),

                  Container(
                    height: 150,
                    margin: EdgeInsets.only(bottom: 16),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: buildDealers(),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> buildDeals(){
    List<Widget> list = [];
    for (var i = 0; i < deals.length; i++) {
      list.add(buildDeal(deals[i], i));
    }
    return list;
  }

  Widget buildDeal(Deal deal, int index){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  deal.condition,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Container(
            height: 120,
            child: Center(
              child: Image.asset(
                deal.images[0],
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          SizedBox(
            height: 24,
          ),

          Text(
            deal.model,
            style: TextStyle(
              fontSize: 18
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Text(
            deal.brand,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "per " + (deal.condition == "Daily" ? "day" : deal.condition == "Weekly" ? "week" : "month"),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }

  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[

            selectedItem == item 
            ? Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColorShadow,
                ),
              ),
            )
            : Container(),

            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24,
              ),
            )

          ],
        ),
      ),
    );
  }

  List<Widget> buildDealers(){
    List<Widget> list = [];
    for (var i = 0; i < dealers.length; i++) {
      list.add(buildDealer(dealers[i], i));
    }
    return list;
  }

  Widget buildDealer(Dealer dealer, int index){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dealer.image), 
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 60,
            width: 60,
          ),

          SizedBox(
            height: 16,
          ),

          Text(
            dealer.name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            dealer.offers.toString() + " offers",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }

}