import 'dart:ui';

import 'package:flutter/material.dart';

import '../../model/destination.dart';
import '../screens/destination_details_screen.dart';

class BestDestinationItemWidget extends StatefulWidget {
  final Destination destination;

  const BestDestinationItemWidget({super.key, required this.destination});

  @override
  State<BestDestinationItemWidget> createState() =>
      _BestDestinationItemWidgetState();
}

class _BestDestinationItemWidgetState extends State<BestDestinationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const DestinationDetailsScreen();
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                widget.destination.imageUrl,
                height: 184,
                width: 152,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    (widget.destination.isLiked)
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded,
                    size: 24,
                  ),
                  color: (widget.destination.isLiked) ? Colors.red : Colors.grey,
                  onPressed: () {
                    setState(() {
                      widget.destination.isLiked = !widget.destination.isLiked;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 8,
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
                          child: Text(
                            widget.destination.label,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
