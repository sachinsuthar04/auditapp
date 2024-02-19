import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
  final void Function(String) onChange;
  final TextEditingController controller;
  final String labelName;

  const DateWidget({
    super.key,
    required this.onChange,
    required this.controller,
    required this.labelName,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            controller: widget.controller,
            //editing controller of this TextField
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_rounded),
                onPressed: () {},
              ), //icon of text field
              labelText: widget.labelName, //label text of field
            ),
            readOnly: true,
            // when true user cannot edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('dd MMM yyyy').format(pickedDate);
                setState(() {
                  widget.onChange(formattedDate);
                });
              } else {}
            }),
        Text(
          'DD MM YYYY',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 14,
              ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
