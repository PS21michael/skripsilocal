import 'package:flutter/material.dart';

class TheButton extends StatefulWidget {

  final String text;
  final Function()? onTap;
  const TheButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<TheButton> createState() => _TheButtonState();
}

class _TheButtonState extends State<TheButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 120),
        width: 180,
        height: 70,
        decoration: BoxDecoration(
          color : Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
