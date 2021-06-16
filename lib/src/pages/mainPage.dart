import 'package:flutter/material.dart';
import 'package:project/src/data/food_item.dart';
import 'package:project/src/pages/foodDetals.dart';
import 'package:project/src/widgets/food_category.dart';
import '../widgets/home_top_info.dart';
import '../widgets/food_category.dart';
import '../widgets/search_file.dart';
import '../widgets/bougt_food.dart';

//data
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> _foods = foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(
            height: 20.0,
          ),
          SearchField(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Friquently Bought Foods",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    "view all",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF8BA50)),
                  )),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: _foods.map(_buildFoodItems).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => FoodDetailsPage(
            food: food,
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFood(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          category: food.category,
          discount: food.discount,
          price: food.price,
          ratings: food.rating,
        ),
      ),
    );
  }
}
