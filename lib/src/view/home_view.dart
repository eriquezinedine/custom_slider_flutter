import 'package:flutter/material.dart';
import 'package:slider_animation/src/data/slider_data.dart';
import 'package:slider_animation/src/widgets/custom_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = SliderData.data;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Image Slider'),
        ),
        body: CustomSlider(
          data: data,
        ));
  }
}
