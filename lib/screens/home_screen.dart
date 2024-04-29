import 'package:flutter/material.dart';
import 'package:ostad_assignment_02/materials/colors.dart';
import 'package:ostad_assignment_02/screens/details_screen.dart';

import '../data/card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        title: const Text(
          'Photo Gallery',
          style: TextStyle(fontWeight: FontWeight.bold),
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
            onPressed: () {},
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
            return GridView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: Data.cardItem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait ? 2 : 4),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 25,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailsScreen(index)));
                    },
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(Data.cardItem[index]['img']!),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.25),
                                BlendMode.darken),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                                blurStyle: BlurStyle.normal),
                          ]
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Text(
                          Data.cardItem[index]['itemName']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
