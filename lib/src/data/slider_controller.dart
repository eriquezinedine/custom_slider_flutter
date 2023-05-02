import 'package:flutter/cupertino.dart';

class SliderController {
  late ScrollController _controller;
  final int length;

  final indexScroll = ValueNotifier(0);

  void init(int length) {
    _controller = ScrollController();
    _controller.addListener(() {
      final maxScroll = _controller.position.maxScrollExtent;
      final pointer = _controller.position.pixels;
      int index = 0;

      if (pointer == maxScroll) {
        index = length - 1;
      } else {
        for (var i = 1; i <= length; i++) {
          if (pointer <= maxScroll * i / length) {
            index = i - 1;
            break;
          }
        }
      }

      indexScroll.value = index;

      // if (0 <= pointer && pointer <= maxScroll * 1 / 5) {
      //   indexScroll.value = 0;
      // } else if (maxScroll * 1 / 5 < pointer && pointer <= maxScroll * 2 / 5) {
      //   indexScroll.value = 1;
      // } else if (maxScroll * 2 / 5 < pointer && pointer <= maxScroll * 3 / 5) {
      //   indexScroll.value = 2;
      // } else if (maxScroll * 3 / 5 < pointer && pointer <= maxScroll * 4 / 5) {
      //   indexScroll.value = 3;
      // } else if (pointer == maxScroll) {
      //   indexScroll.value = 4;
      // }
    });
  }

  SliderController({required this.length}) {
    init(length);
  }

  void dispose() {
    _controller.dispose();
  }

  void positionInit(double position) {
    _controller.animateTo(position,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void changeIndex(int index) {
    indexScroll.value = index;
  }

  ScrollController get getController => _controller;
}
