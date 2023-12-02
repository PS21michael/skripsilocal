import 'package:flutter/material.dart';

class SquareTile extends StatefulWidget {
  final String imagePath;
  //final Function()? onTap;

  const SquareTile({
    super.key,
    required this.imagePath,
    //required this.onTap,
  });

  @override
  State<SquareTile> createState() => _SquareTileState();
}

class _SquareTileState extends State<SquareTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade100,
        ),
        child: Image(
          image: AssetImage(widget.imagePath),
          height: 40,
        ),
      ),
    );
  }
}
