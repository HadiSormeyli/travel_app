import 'package:flutter/material.dart';

import '../../model/vacation.dart';

class PromotionItemWidget extends StatelessWidget {
  final Vacation vacation;

  const PromotionItemWidget({super.key, required this.vacation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.only(left: 16, top: 16, right: 0, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blue,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlueAccent.withOpacity(0.6),
              Colors.red.withOpacity(0.5)
            ]),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                vacation.airlineLogo,
                height: 24,
                width: 24,
              ),
              Text(
                vacation.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              if (vacation.discount != 0)
                Text(
                  "Discount up to ${vacation.discount}%",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              const SizedBox(height: 24),
              Text(
                vacation.date,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            width: 56,
          ),
          Image.asset("assets/images/image1.png"),
        ],
      ),
    );
  }
}
