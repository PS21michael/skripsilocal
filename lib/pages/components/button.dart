import 'package:flutter/material.dart';

class theButton extends StatefulWidget {

  final String text;
  final Function()? onTap;
  const theButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<theButton> createState() => _theButtonState();
}

class _theButtonState extends State<theButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 120),
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          color : Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
