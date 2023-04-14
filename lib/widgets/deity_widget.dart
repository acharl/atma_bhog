import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../global.dart';

class DeityWidget extends StatefulWidget {
  const DeityWidget({super.key});

  @override
  State<DeityWidget> createState() => RDeityWidgetState();
}

class RDeityWidgetState extends State<DeityWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF0c1421),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }, scrollbars: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      story(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container story() {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(bottom: 10),
      // height: 400,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Bhajans",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }, scrollbars: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(storyData.length, (index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 80,
                                    backgroundColor:
                                        Color.fromARGB(255, 245, 60, 13),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 75,
                                    backgroundImage: AssetImage(
                                      "${storyData[index]["logo"]}",
                                    ),
                                  ),
                                  if (storyData[index]["isLive"])
                                    Positioned(
                                      bottom: -3,
                                      child: Container(
                                        color: Colors.pink,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        child: const Text(
                                          "LIVE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                storyData[index]["firstName"],
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Container appBar() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(
        top: 5,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
          // color: Colors.red,
          ),
      child: Row(
        children: [
          Container(
            width: 300,
            height: 30,
            padding: const EdgeInsets.only(top: 2, bottom: 2, left: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: const Row(children: [
              Icon(
                Icons.search_outlined,
                color: Color(0xFF192526),
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Search",
                style: TextStyle(color: Colors.grey),
              )
            ]),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_rounded),
          ),
          const SizedBox(
            width: 5,
          ),
          Material(
            elevation: 12,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Container(
                height: 30,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.9,
                      0.9,
                    ],
                    colors: [
                      Colors.orange,
                      Color.fromARGB(255, 233, 111, 30),
                      Color.fromARGB(255, 224, 67, 39),
                      Colors.pink,
                      Colors.pink,
                    ],
                  ),
                ),
                child: const Text(
                  "+  Create a post",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
