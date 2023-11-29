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
      height: 400,
      decoration: BoxDecoration(
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
            Icon(
              Icons.lock,
              size: 20,
            ),
            Text(
              calon.nomorUrut,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      calon.namaCawapres
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        calon.namaCawapres
                    ),
                  ),
                  Text(
                    calon.namaCapres,
                  ),
                  Text(
                    calon.namaCawapres,
                  ),
                ],
              ),
            ),
            Text(
              calon.keterangan,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
