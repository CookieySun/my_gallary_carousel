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
  var _favList = <int>[];

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
              itemBuilder: (context, index) => _imageView(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageView(int index) {
    final imageUrl = 'https://source.unsplash.com/random/275x240?sig=$index';
    return GestureDetector(
      onTap: () => _tapFav(index),
      child: Stack(
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _isSet(index)
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border,
                  ),
          )
        ],
      ),
    );
  }

  void _tapFav(int index) {
    setState(() {
      if (_isSet(index)) {
        _favList.remove(index);
      } else {
        _favList.add(index);
      }
    });
  }

  bool _isSet(index) => _favList.contains(index);
}
