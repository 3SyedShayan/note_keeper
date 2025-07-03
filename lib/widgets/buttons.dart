import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  FormButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16)),
        backgroundColor: WidgetStateProperty.all(Colors.purple),
        splashFactory: NoSplash.splashFactory,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
      child: Text(title),
    );
  }
}
