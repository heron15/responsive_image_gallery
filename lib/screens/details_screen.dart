import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/card_list.dart';
import '../data/suggest_list.dart';
import '../materials/colors.dart';

class DetailsScreen extends StatelessWidget {
  late int index;

  DetailsScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        title: Text(
          Data.cardItem[index]['itemName']!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: CustomColor.white,
        centerTitle: true,
        leading: Container(
          width: 17,
          height: 17,
          margin: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
          decoration: BoxDecoration(
              color: CustomColor.tranWhite,
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    width: 390,
                    height: 325,
                    margin: const EdgeInsets.only(left: 19, right: 19, top: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(Data.cardItem[index]['img']!),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 35,
                              offset: Offset(0, 15),
                              blurStyle: BlurStyle.normal)
                        ]),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 33, right: 33, top: 18),
                    child: Text(
                      Data.cardItem[index]['title']!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 33, right: 33, top: 10),
                    child: Text(
                      Data.cardItem[index]['desc']!,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    width: 387,
                    height: 51,
                    margin: const EdgeInsets.only(left: 19, right: 19, top: 25),
                    decoration: BoxDecoration(
                        color: CustomColor.primaryColor,
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 35,
                              offset: const Offset(0, 15),
                              blurStyle: BlurStyle.normal)
                        ]),
                    alignment: Alignment.center,
                    child: const Text(
                      'See More',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      left: 32,
                      top: 15,
                    ),
                    child: const Text(
                      'Suggestions',
                      style: TextStyle(
                          color: CustomColor.primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SuggestItemContainer(SuggestItem.suggestList[0]['img']!,
                            SuggestItem.suggestList[0]['title']!,
                            MediaQuery.of(context).size.width * 0.45),
                        const SizedBox(
                          width: 10,
                        ),
                        SuggestItemContainer(SuggestItem.suggestList[1]['img']!,
                            SuggestItem.suggestList[1]['title']!,
                            MediaQuery.of(context).size.width * 0.45)
                      ],
                    ),
                  )
                ],
              ));
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child:  Container(
                          width: 372,
                          height: 298,
                          margin: const EdgeInsets.only(left: 19, right: 19, top: 10, bottom: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: NetworkImage(Data.cardItem[index]['img']!),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 35,
                                    offset: Offset(0, 15),
                                    blurStyle: BlurStyle.normal)
                              ]),
                        ),
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 33, right: 33, top: 18),
                              child: Text(
                                Data.cardItem[index]['title']!,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 33, right: 33, top: 10),
                              child: Text(
                                Data.cardItem[index]['desc']!,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              width: 387,
                              height: 51,
                              margin: const EdgeInsets.only(left: 19, right: 19, top: 25),
                              decoration: BoxDecoration(
                                  color: CustomColor.primaryColor,
                                  borderRadius: BorderRadius.circular(200),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 35,
                                        offset: const Offset(0, 15),
                                        blurStyle: BlurStyle.normal)
                                  ]),
                              alignment: Alignment.center,
                              child: const Text(
                                'See More',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                left: 32,
                                top: 15,
                              ),
                              child: const Text(
                                'Suggestions',
                                style: TextStyle(
                                    color: CustomColor.primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SuggestItemContainer(SuggestItem.suggestList[0]['img']!,
                                      SuggestItem.suggestList[0]['title']!,
                                      MediaQuery.of(context).size.width * 0.22),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SuggestItemContainer(SuggestItem.suggestList[1]['img']!,
                                      SuggestItem.suggestList[1]['title']!,
                                      MediaQuery.of(context).size.width * 0.22)
                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget SuggestItemContainer(String img, String title, double width) {
  return Container(
    width: width,
    height: 180,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25), BlendMode.darken),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 15),
              blurStyle: BlurStyle.normal),
        ]),
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    ),
  );
}
