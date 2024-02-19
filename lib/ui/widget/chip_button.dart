import 'package:flutter/material.dart';

class ChipButton extends StatelessWidget {
  final String text;
  final Widget child;
  final double? height;
  final Color? color;
  final bool? isSelected;

  const ChipButton({
    super.key,
    this.text = '',
    this.child = const SizedBox.shrink(),
    this.height = 50,
    this.color = Colors.green,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected! ? Colors.green : Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
