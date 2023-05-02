import 'package:flutter/material.dart';
import 'package:slider_animation/src/data/slider_controller.dart';
import 'package:slider_animation/src/widgets/circle_item.dart';
import 'package:slider_animation/src/widgets/container_expanded.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int length = 5;
    final controller = SliderController(length: length);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            controller: controller.getController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                ...List.generate(5, (index) {
                  return const ContainerExpanded();
                })
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _ControllerSlider(controller: controller)
        ],
      )),
    );
  }
}

class _ControllerSlider extends StatelessWidget {
  const _ControllerSlider({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SliderController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: controller.indexScroll,
        builder: (_, int value, __) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              ...List.generate(controller.length, (index) {
                return CircleItem(
                  isActive: index == value,
                  onTap: () {
                    controller.changeIndex(index);
                    final maxScroll =
                        controller.getController.position.maxScrollExtent;
                    controller.positionInit(index == 0
                        ? 0
                        : maxScroll * (index + 1) / controller.length);
                  },
                );
              })
            ],
          );
        });
  }
}
