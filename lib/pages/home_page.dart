import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 20),
        child: Column(
          children: [
            // Nedemy row(title bar)
            Row(
              children: [
                const Text(
                  'Nedemy',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                    //color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            //Your Course section
            Row(
              children: [
                const Text(
                  'Your Course',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Expanded(child: Container()),
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/video');
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 20,
                      //color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            // Upper Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 7, 71, 181),
                    Colors.blue,
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 20,
                      color: Color.fromARGB(255, 229, 238, 242),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 10, bottom: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Next Lesson',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Introduction to CSS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(child: Container()),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '32 min',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 25, 89, 199),
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/video');
                              },
                              icon: const Icon(
                                Icons.play_circle_filled,
                                size: 60,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Qoute Container
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 134, 172, 237),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        offset: const Offset(8, 16),
                        color: Colors.grey.withOpacity(0.4)),
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(-1, -5),
                        color: Colors.grey.withOpacity(0.4)),
                  ]),
            ),

            const SizedBox(
              height: 10,
            ),

            //Courses title row
            const Row(
              children: [
                Text(
                  'Courses',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Course Lists
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: (info.length.toDouble() / 2).toInt(),
                    itemBuilder: (_, index) {
                      int x = 2 * index;
                      int y = 2 * index + 1;
                      return Row(
                        children: [

                          // Left side Course lists
                          Container(
                            height: 120,
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            margin: const EdgeInsets.only(
                                left: 30, bottom: 10, top: 10),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(info[x]['image']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(5, 5),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-5, -5),
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                ]),
                            child: Center(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[x]['title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )),
                          ),

                          // Right side Course Lists
                          Container(
                            height: 120,
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            margin: const EdgeInsets.only(left: 30, bottom: 10, top: 15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(info[y]['image']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(5, 5),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-5, -5),
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                ]),
                            child: Center(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[y]['title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )),
                          ),
                        ],
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
