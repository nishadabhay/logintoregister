import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.action, required this.title, this.width});
  final void Function() action;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: Container(
        width: width ?? 50,
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(title),
      ),
    );
  }
}
