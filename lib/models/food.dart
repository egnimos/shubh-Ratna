import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Food {
  final String id;
  final String foodName;
  final String description;
  final String rating;
  final bool isAvailable;
  final List<String> imageUrls;

  //construct
  Food({
    @required this.id,
    @required this.foodName,
    @required this.description,
    @required this.rating,
    @required this.imageUrls,
    @required this.isAvailable,
  });

  // from JSON
  factory Food.fromJSON(DocumentSnapshot doc) {
    return Food(
      id: doc.data()["id"],
      foodName: doc.data()["foodName"],
      description: doc.data()["description"],
      rating: doc.data()["rating"],
      imageUrls: doc.data()["imageUrls"],
      isAvailable: doc.data()["isAvailable"],
    );
  }

  // to JSON
  Map<String, dynamic> toJSON(Food food) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = food.id;
    data["foodName"] = food.foodName;
    data["description"] = food.description;
    data["rating"] = food.rating;
    data["imageUrls"] = food.imageUrls;
    data["isAvailable"] = food.isAvailable;

    return data;
  }
}
