import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter/material.dart';

class MyImageSlider extends StatelessWidget {
  const MyImageSlider({
    super.key,
    required this.onChnage,
    required this.currentSlide,
  });

  final Function(int) onChnage;
  final int currentSlide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChnage,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  'images/slider1.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider2.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider3.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider4.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider5.jpeg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentSlide == index ? 20 : 10,
                    height: currentSlide == index ? 20 : 10,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentSlide == index
                            ? kprimaryColor
                            : Colors.transparent,
                        border: Border.all(
                            color: currentSlide == index
                                ? kprimaryColor
                                : Colors.black)),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
