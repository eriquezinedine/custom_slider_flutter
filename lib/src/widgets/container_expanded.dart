import 'package:flutter/material.dart';
import 'package:slider_animation/src/data/slider_data.dart';

class ContainerExpanded extends StatefulWidget {
  const ContainerExpanded({super.key, required this.sliderData});

  @override
  State<ContainerExpanded> createState() => _ContainerExpandedState();

  final SliderData sliderData;
}

class _ContainerExpandedState extends State<ContainerExpanded>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isExpanded = false;

  final sizeText = 64.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // _controller.repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: sizeText).animate(_controller);
    // _controller.forward();
  }

  @override
  void dispose() {
    _animation.isDismissed;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isExpanded) {
          _controller.reverse();
        } else {
          _controller.forward();
        }

        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(left: 8, bottom: 8),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.sliderData.img),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(right: 10),
        height: 150,
        width: isExpanded ? 250 : 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                      offset: Offset(0, sizeText - _animation.value),
                      child: Text(
                        widget.sliderData.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ));
                }),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isExpanded ? 1 : 0,
              child: SizedBox(
                height: sizeText,
                child: Text(
                  widget.sliderData.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
