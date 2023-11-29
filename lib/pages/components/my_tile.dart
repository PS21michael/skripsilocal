import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/data/calon.dart';

class myTile extends StatelessWidget {

  final Calon calon;

  const myTile({
    super.key,
    required this.calon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.only(bottom: 25),
      //padding: EdgeInsets.all(25),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              calon.nomorUrut,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              calon.imagePath,
            ),
            SizedBox(height: 10),
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      calon.namaCapres,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      calon.namaCawapres,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
