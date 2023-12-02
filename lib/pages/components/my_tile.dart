import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/data/calon.dart';

class MyTile extends StatelessWidget {

  final Calon calon;

  final void Function()? onTap;

  const MyTile({
    super.key,
    required this.calon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          margin: const EdgeInsets.only(
            bottom: 10,
            top: 10,
          ),
          //padding: EdgeInsets.all(25),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  calon.nomorUrut,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  calon.imagePath,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          calon.namaCapres,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          calon.namaCawapres,
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}