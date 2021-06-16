import 'package:flutter/material.dart';
import '../widgets/custom_list_tile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(0, 4.0),
                            color: Colors.black38,
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1542458580-661eae5bec20?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aGFiZXNoYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Daneal Tegeg",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "0930303030",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 20.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffE94949),
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                color: Color(0xffE94949), fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      CustomListTile(
                        icon: Icons.location_on,
                        text: "Location",
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                        icon: Icons.visibility,
                        text: "Change Password",
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                        icon: Icons.shopping_cart,
                        text: "Shopping",
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                        icon: Icons.payment,
                        text: "Payment",
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "APP Notification",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Switch(
                            activeColor: Color(0xffF8BA50),
                            value: turnOnNotification,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnNotification = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Location Tracking",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Switch(
                            activeColor: Color(0xffF8BA50),
                            value: turnOnLocation,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnLocation = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Other",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Language",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          color: Colors.grey,
                        ),
                        Text(
                          "Currency",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
