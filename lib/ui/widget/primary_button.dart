import 'package:flutter/material.dart';

/// Use [PrimaryButton] where in the places of common Raised Button.
/// Needs text, onPressed Function, disabled flag.
/// Have Solid background with white or other color as text color.
/// Use [PrimaryButton] like this:
/// For child <Widget>
///
///  PrimaryButton({
///    text: 'login',
///    onPressed: () => login(),
///    disabled: false,
///  });
///  ```

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool disabled;
  final String text;
  final bool needWidget;
  final Widget child;
  final double? height;
  final ButtonStyle? style;
  final Color? color;

  const PrimaryButton({
    super.key,
    this.onPressed,
    this.disabled = false,
    this.needWidget = false,
    this.text = '',
    this.child = const SizedBox.shrink(),
    this.height = 50,
    this.color = Colors.green,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
        child: needWidget
            ? child
            : Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
      ),
    );
  }
}
