import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser {
  final String id;
  final String displayName;
  final String email;
  final String referNumber;
  final String phoneNumber;
  final String location;
  final String areaPincode;
  final String type;

  //construct
  CurrentUser({
    @required this.id,
    @required this.displayName,
    @required this.email,
    @required this.referNumber,
    @required this.phoneNumber,
    @required this.location,
    @required this.areaPincode,
    @required this.type,
  });

  //from json
  factory CurrentUser.fromJson(DocumentSnapshot doc) {
    return CurrentUser(
      id: doc.data()["id"],
      displayName: doc.data()["displayName"],
      email: doc.data()["email"],
      referNumber: doc.data()["referNumber"],
      phoneNumber: doc.data()["phoneNumber"],
      location: doc.data()["location"],
      areaPincode: doc.data()["areaPincode"],
      type: doc.data()["type"],
    );
  }

  //to json
  Map<String, dynamic> toJson(CurrentUser user) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = user.id;
    data["displayName"] = user.displayName;
    data["email"] = user.email;
    data["referNumber"] = user.referNumber;
    data["phoneNumber"] = user.phoneNumber;
    data["location"] = user.location;
    data["areaPincode"] = user.areaPincode;
    data["type"] = user.type;

    return data;
  }
}
