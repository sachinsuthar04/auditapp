import 'package:flutter/material.dart';

class TextTimeWidget extends StatelessWidget {
  final String date;

  const TextTimeWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_month, color: Colors.black),
        Text(
          date,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 18,
              ),
        ),
      ],
    );
  }
}
