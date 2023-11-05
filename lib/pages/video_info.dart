import 'package:flutter/material.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70,left: 30, right: 30),
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 5, 98, 174),
              Colors.grey.withOpacity(0.9)
            ],
            begin: const FractionalOffset(0, 0.4),
            end: Alignment.topRight)
        ),
        child:  Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.arrow_back_ios,
                      color: Colors.white),
                      Expanded(child: Container()),
                      const Icon(Icons.info_outline,
                      color: Colors.white
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Row(
              children: [
                Text('CSS Selectors',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 2
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}