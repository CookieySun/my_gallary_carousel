import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "(stful) Image Carousel",
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  var favList = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("(stful) Image Carousel"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1st Category",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "2st Category",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller:
                  PageController(viewportFraction: 0.75, initialPage: 999),
              itemBuilder: (context, index) {
                final imageUrl =
                    'https://source.unsplash.com/random/275x240?sig=$index';
                return Image.network(imageUrl);
              },
            ),
          ),
        ],
      ),
    );
  }
}
