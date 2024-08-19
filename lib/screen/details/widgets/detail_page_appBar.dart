import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailPageAppbar extends StatelessWidget {
  const DetailPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kprimaryBackgroungColor,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kprimaryBackgroungColor,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          const SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kprimaryBackgroungColor,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
    );
  }
}
