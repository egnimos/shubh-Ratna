import 'package:flutter/material.dart';
import 'package:restaurantApp/dummy_data/food_dummy.dart';
// import 'package:restaurantApp/config/responsive.dart';
import 'package:restaurantApp/widgets/productCard.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text("Shubh Ratna",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  // fontFamily: "Ubuntu",
                )),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
          )
        ],
      ),
      body: columnBuilder(context),
    );
  }
}

Widget columnBuilder(BuildContext context) {
  return ListView(
    // shrinkWrap: true,
    children: [
      //sections
      section(context),
      //Announcement
      heading(context, text: "Anouncement"),
      announcementAndProductCard(context),
      //offers
      heading(context, text: "Special Offers in Foods"),
      specialOfferList(context),

      heading(context, text: "Special Offers in Rooms")
    ],
  );
}

//heading
Widget heading(
  BuildContext context, {
  @required String text,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 21.0),
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodyText2.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
    ),
  );
}

//section
Widget section(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    height: 160,
    child: ListView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        SizedBox(
          width: 16.0,
        ),
        card(context, assetImage: "assets/images/icon1.png", text: "BreakFast"),
        card(context, assetImage: "assets/images/icon2.jpg", text: "Lunch"),
        card(context, assetImage: "assets/images/icon3.png", text: "Dinner"),
        SizedBox(
          width: 16.0,
        ),
      ],
    ),
  );
}

//special offers product
Widget specialOffersProduct(
  BuildContext context, {
  @required List<String> imageUrls,
  @required String heading,
  @required String description,
  @required String rating,
}) {
  return Card(
    margin: EdgeInsets.all(5.0),
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: SizedBox(
      width: 130,
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Image.network(
              "${imageUrls[0]}",
              width: 130,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          //product name
          Padding(
            padding: const EdgeInsets.only(
              top: 4.0,
              left: 6.0,
            ),
            child: Text(
              "$heading",
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          //description
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                // top: 4.0,
                left: 6.0,
              ),
              child: Text(
                "$description",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.grey,
                    ),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),

          //rate, read more
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$rating",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.grey,
                      ))
            ],
          ),
        ],
      ),
    ),
  );
}

//special offer product list
Widget specialOfferList(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    height: 180,
    child: ListView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: foodList.map((f) {
        return specialOffersProduct(
          context,
          imageUrls: f.imageUrls,
          heading: f.foodName,
          description: f.description,
          rating: f.rating,
        );
      }).toList(),
    ),
  );
}
