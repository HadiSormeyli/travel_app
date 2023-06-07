import 'package:flutter/material.dart';

import '../../model/destination.dart';
import '../../model/vacation.dart';
import '../widgets/best_destination_item_widget.dart';
import '../widgets/promotion_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _destinationItems = [
    Destination(true, "assets/images/j0.jpg", "Tokyo"),
    Destination(false, "assets/images/l.jpg", "London"),
    Destination(false, "assets/images/e.jpg", "England"),
    Destination(false, "assets/images/j0.jpg", "China"),
  ];

  final _vacationItems = [
    Vacation("June vacation", 50, "assets/images/image3.png", "9-28 June 2022"),
    Vacation("June vacation", 0, "assets/images/image3.png", "9-28 June 2022"),
    Vacation("June vacation", 10, "assets/images/image3.png", "9-28 June 2022"),
    Vacation("June vacation", 35, "assets/images/image3.png", "9-28 June 2022"),
  ];

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _animation =
        Tween<Offset>(begin: const Offset(0.4, 0), end: const Offset(0.0, 0.0))
            .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/main.jpg',
                  fit: BoxFit.cover,
                  height: 300,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Good Morning 😉"),
                          SizedBox(height: 12),
                          Text(
                            "Alivan Putra",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w900),
                          ),
                        ],
                      )),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 252),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best Destination",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_sharp),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SlideTransition(
              position: _animation,
              child: SizedBox(
                height: 184,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  itemCount: _destinationItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return BestDestinationItemWidget(
                        destination: _destinationItems[i]);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Promotion",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_sharp),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SlideTransition(
                position: _animation,
                child: SizedBox(
                  height: 184,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    itemCount: _vacationItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return PromotionItemWidget(vacation: _vacationItems[i]);
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
