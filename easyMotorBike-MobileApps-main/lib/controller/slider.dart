import 'package:carousel_slider/carousel_slider.dart';
import 'package:easymotorbike/generat/images.dart';
import 'package:flutter/material.dart';

class PromotionsBanner extends StatefulWidget {
  const PromotionsBanner({super.key});

  @override
  State<PromotionsBanner> createState() => _PromotionsBannerState();
}

class _PromotionsBannerState extends State<PromotionsBanner> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildPromotionsBanner(),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: _buildCarouselIndicator(),
        ),
      ],
    );
  }

  Widget _buildPromotionsBanner() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.3,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
          viewportFraction: 1.0,
        ),
        items: [
          (Image.asset(
            slider1,
            fit: BoxFit.fill,
          )),
          (Image.asset(
            slider1,
            fit: BoxFit.fill,
          )),
        ],
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 2; i++)
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentIndex == i ? 12 : 8,
            height: _currentIndex == i ? 9 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == i ? Colors.green : Colors.grey,
            ),
          ),
      ],
    );
  }
}
