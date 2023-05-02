import 'package:flutter/material.dart';

class CircleItem extends StatefulWidget {
  const CircleItem({
    super.key,
    required this.onTap,
    this.isActive = false,
  });
  final VoidCallback onTap;
  final bool isActive;
  @override
  State<CircleItem> createState() => _CircleItemState();
}

class _CircleItemState extends State<CircleItem> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  // bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
        // setState(() {
        //   isChange = !isChange;
        // });
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.only(right: 5),
        width: 10,
        height: 10,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isActive
                ? Color.fromARGB(255, 175, 168, 168)
                : Colors.black45),
      ),
    );
  }
}
