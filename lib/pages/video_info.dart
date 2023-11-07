import 'dart:convert';

import 'package:flutter/material.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  List videoInfo = [];

  _initData() async{
    await DefaultAssetBundle.of(context).loadString('json/video.json').then((value) {
      videoInfo = jsonDecode(value);
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
      body: Container(
        //height: 350,

        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 5, 98, 174),
          Colors.grey.withOpacity(0.9)
        ], begin: const FractionalOffset(0, 0.4), end: Alignment.topRight)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 70, left: 30, right: 30, bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                      ),
                      Expanded(child: Container()),
                      const Icon(Icons.info_outline, color: Colors.white),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        'CSS Selectors',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            letterSpacing: 2),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '32 min',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Tutorial 4: CSS Selectors',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: videoInfo.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: 135,
                              width: 200,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(videoInfo[index]["thumbnail"]),)
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      const SizedBox(height: 20,),
                                      Text(videoInfo[index]["title"]),
                                      Text(videoInfo[index]["time"]),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
