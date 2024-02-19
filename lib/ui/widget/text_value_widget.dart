import 'package:flutter/material.dart';

class TextValueWidget extends StatelessWidget {
  final String keyName;
  final String value;
  final double? fontSize;

  const TextValueWidget({
    super.key,
    required this.keyName,
    required this.value,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$keyName: ",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: fontSize,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: fontSize,
              ),
        ),
      ],
    );
  }
}
