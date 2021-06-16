import 'package:flutter/material.dart';
import 'package:project/src/models/food_model.dart';
import 'package:project/src/pages/orderpage.dart';
import 'package:project/src/widgets/location.dart';

class CartListView extends StatefulWidget {
  VoidCallback callback;
  final Food cart;
  CartListView(this.callback, this.cart);
  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    var cart;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100.0,
        ),
        Center(
          child: Container(
            child: Stack(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(child: Text(cart.name)),
                Positioned(
                  top: 30,
                  child: CircleAvatar(child: Image.asset(cart.imagePath)),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class Myhoem2 extends StatelessWidget {
  final Food cart;

  const Myhoem2({Key key, this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: Container(
        child: Center(
            child: Column(
          children: [
            Text(cart.name),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => OrderPage()));
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
          ],
        )),
      )),
    );
  }
}
