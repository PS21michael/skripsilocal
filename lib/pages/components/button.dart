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
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 120),
        decoration: BoxDecoration(
          color : Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
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
