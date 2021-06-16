import 'package:flutter/material.dart';
import 'package:project/src/models/food_model.dart';
import 'package:project/src/pages/mainPage.dart';
import 'package:project/src/pages/order.dart';
import 'package:project/src/pages/orderpage.dart';
import 'package:project/src/pages/profile_page.dart';
import '../pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  ProfilePage profilePage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage = HomePage();
    orderPage = OrderPage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, profilePage];
    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Gebeta Delivery",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                // size: 30.0,
                color: Color(0xffE94949),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: _buildShhopingCart(),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
                currentPage = pages[index];
              });
            },
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xffE94949),
            selectedIconTheme: IconThemeData(
              size: 30,
            ),
            unselectedItemColor: Color(0xff7E7E7E),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: ("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: ("Orders"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                ),
                label: ("Profile"),
              ),
            ]),
        body: currentPage,
      ),
    );
  }

  Widget _buildShhopingCart() {
    return Stack(
      children: <Widget>[
        Icon(
          Icons.shopping_cart_outlined,
          // size: 30.0,
          color: Color(0xffE94949),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            height: 12.0,
            width: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
