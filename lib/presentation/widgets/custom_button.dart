import 'package:contact_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isDanger;
  final String label;
  const CustomButton({
    super.key,
    this.onPressed,
    this.isDanger = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              isDanger ? white : lightBlue.withOpacity(0.2),
            ),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: isDanger ? const BorderSide(color: red) : BorderSide.none,
              ),
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                color: isDanger ? red : blue,
                fontSize: 16,
                fontWeight: isDanger ? FontWeight.w400 : FontWeight.w900,
              ),
            )),
        child: Text(
          label,
        ),
      ),
    );
  }
}
