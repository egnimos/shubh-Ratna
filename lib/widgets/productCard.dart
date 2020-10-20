import 'package:flutter/material.dart';

/*
Category card for example "breakFast", "Lunch", "Dinner", 
*/
Widget card(
  BuildContext context, {
  @required String assetImage,
  @required String text,
}) {
  return Card(
    margin: EdgeInsets.all(5.0),
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    child: Container(
      // color: Colors.red,
      height: 150,
      width: 130,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints.tight(Size.square(70)),
            child: Image.asset(
              assetImage,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
          )
        ],
      ),
    ),
  );
}

/*
Product card or announcement card example list of widgets of rooms 
or food card
*/
Widget announcementAndProductCard(context) {
  return Card(
    margin: EdgeInsets.only(
      left: 21.0,
      right: 21.0,
      bottom: 21.0,
      top: 7.0,
    ),
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    child: Container(
      // width: 100,
      height: 150,
      padding: EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              constraints: BoxConstraints.tight(
                Size.square(
                  100,
                ),
              ),
              child: Image.network(
                "https://image.freepik.com/free-vector/noisy-big-megaphone_74855-7630.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),

          //Info
          Expanded(
            child: Container(
              padding: EdgeInsets.all(14.0),
              height: 100,
              child: Column(
                children: [
                  //short heading...
                  Text(
                    "Big Billion Sale!! 😊 be ready to buy the products",
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),

                  //summary
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "So we presents the discounts in each product for a limited period of the time.. go and grab a sale grab all things you want..",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
