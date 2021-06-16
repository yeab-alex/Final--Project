import 'package:flutter/material.dart';
import 'package:project/src/models/food_model.dart';
import 'package:project/src/pages/order.dart';
import 'package:project/src/widgets/button.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food food;
  FoodDetailsPage({
    this.food,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Food Details",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "${food.imagePath}",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${food.price}",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffF8BA50),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Description",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("${food.description}", textAlign: TextAlign.justify),

              SizedBox(
                height: 50.0,
              ),
              //add to cart
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Myhoem2(cart: food)),
                ),
                child: Button(
                  btnText: "Add to cart",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
