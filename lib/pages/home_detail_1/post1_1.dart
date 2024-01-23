import 'package:flutter/material.dart';

class Post1_1 extends StatelessWidget {
  const Post1_1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'nama: '
            ),
            Text(
                'nama: '
            ),
          ],
        ),
      ),
    );
  }
}
