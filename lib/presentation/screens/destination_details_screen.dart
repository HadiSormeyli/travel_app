import 'dart:ui';

import 'package:flutter/material.dart';

class DestinationDetailsScreen extends StatefulWidget {
  const DestinationDetailsScreen({super.key});

  @override
  State<DestinationDetailsScreen> createState() =>
      _DestinationDetailsScreenState();
}

class _DestinationDetailsScreenState extends State<DestinationDetailsScreen> {
  bool _isLiked = true;

  final _images = [
    "assets/images/j1.jpg",
    "assets/images/j2.jpg",
    "assets/images/j3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                )),
            title: const Text(
              "Details of Tokyo",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    "assets/images/j0.jpg",
                    fit: BoxFit.cover,
                    height: 450,
                  ),
                  Positioned(
                    bottom: 72,
                    left: 24,
                    child: ClipRect(
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    // assign the color to the border color
                                    color: Colors.grey[400]!,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: Colors.grey.shade200.withOpacity(0.4)),
                              child: Center(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Summer at Tokyo",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Image.asset(
                                      "assets/images/image2.png",
                                      height: 24,
                                      width: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 400),
                    width: double.infinity,
                    height: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: const EdgeInsets.only(top: 4),
                            width: 48,
                            height: 6,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ))),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tokyo',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          border: Border.all(
                                              color:
                                                  Colors.red.withOpacity(0.25),
                                              width: 1),
                                          color:
                                              Colors.black.withOpacity(0.05)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 8,
                                          width: 8,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32)),
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Japan, East Asia',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                            Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 8,
                                      offset: const Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    (_isLiked)
                                        ? Icons.favorite
                                        : Icons.favorite_outline_rounded,
                                    size: 24,
                                  ),
                                  color: (_isLiked) ? Colors.red : Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      _isLiked = !_isLiked;
                                    });
                                  },
                                )),
                          ],
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Tokyo is an exciting and bustling travel destination that offers visitors a unique blend of traditional Japanese culture and modern city life. Located on the eastern coast of Japan Honshu Island, Tokyo is a sprawling metropolis with a population of over 13 million people.One of the most iconic sights in Tokyo is the towering Skytree, which offers panoramic views of the city from its observation deck. Other popular tourist attractions include the historic Sensō-ji Temple in Asakusa, the beautiful Shinjuku Gyoen National Garden, and the vibrant shopping districts of Shibuya and Harajuku.Food lovers will also find plenty to enjoy in Tokyo, with its many restaurants offering a wide range of both traditional and modern Japanese cuisine. From sushi to ramen, tempura to yakitori, there is something for every taste bud.Overall, Tokyo is a must-see destination for anyone interested in experiencing Japan unique blend of ancient traditions and modern innovation.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        )),
                    const SizedBox(
                      height: 32,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Best place to visit',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w900),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        height: 184,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shrinkWrap: true,
                          itemCount: _images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  _images[i],
                                  height: 184,
                                  width: 176,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        )),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Start Adventure to Tokyo ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
