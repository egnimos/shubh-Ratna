import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Room {
  final String id;
  final String roomType;
  final String description;
  final String rating;
  final List<String> imageUrls;
  final bool isAvailable;

  //construct
  Room({
    @required this.id,
    @required this.roomType,
    @required this.description,
    @required this.rating,
    @required this.imageUrls,
    @required this.isAvailable,
  });

  //from JSON
  factory Room.fromJSON(DocumentSnapshot doc) {
    return Room(
      id: doc.data()["id"],
      roomType: doc.data()["roomType"],
      description: doc.data()["description"],
      rating: doc.data()["rating"],
      imageUrls: doc.data()["imageUrls"],
      isAvailable: doc.data()["isAvailable"],
    );
  }

  //to JSON
  Map<String, dynamic> toJSON(Room room) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = room.id;
    data["roomType"] = room.roomType;
    data["description"] = room.description;
    data["rating"] = room.rating;
    data["imageUrls"] = room.imageUrls;
    data["isAvailable"] = room.isAvailable;
    return data;
  }
}
