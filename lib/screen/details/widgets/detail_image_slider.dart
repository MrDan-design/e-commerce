import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  const DetailImageSlider({
    super.key,
    required this.image,
    required this.onChange,
  });

  final String image;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Hero(tag: image, child: Image.asset(image));
        },
      ),
    );
  }
}
