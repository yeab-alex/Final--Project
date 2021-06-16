import 'package:flutter/material.dart';
import 'package:project/src/models/food_model.dart';
import 'package:project/src/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:project/src/widgets/location.dart';

class CartConstant {
  static int packageCount;
  static List<int> list;
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int data = 3;

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            return SafeArea(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: data,
                itemBuilder: (BuildContext context, int index) {
                  return CartListView(refresh);
                },
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                scrollDirection: Axis.vertical,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 220.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtotal",
                  style: TextStyle(
                      color: Color(0xFF9BA7C6),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  CartConstant.packageCount.toString(),
                  style: TextStyle(
                      color: Color(0xFF6C6D6D),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Discount",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "0.0",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Cart Total",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MapPage()));
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xffE94949),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "proceed to checkout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class CartListView extends StatefulWidget {
  VoidCallback callback;

  CartListView(this.callback);
  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  int _counter = 1;
  int getPrice(int i, int priceC) {
    CartConstant.packageCount = i * priceC;
    return CartConstant.packageCount;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            _counter++;
                            if (_counter > 20) {
                              _counter = 20;
                            }
                          });

                          widget.callback();
                        },
                        child: Icon(Icons.add, color: Color(0xFFD3D3D3))),
                    Text(
                      "$_counter",
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _counter--;
                            if (_counter < 2) {
                              _counter = 1;
                            }
                          });

                          widget.callback();
                        },
                        child: Icon(Icons.remove, color: Color(0xFFD3D3D3))),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/kitfo.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0))
                  ]),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "kitfo",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                SizedBox(height: 5.0),
                Container(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Price",
                              style: TextStyle(
                                  color: Color(0xFFD3D3D3),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              getPrice(_counter, 2000).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF8BA50),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
