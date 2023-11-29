import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/components/my_tile.dart';
import 'package:skripsilocal/pages/data/calon.dart';
import 'components/my_header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});

  List calon = [
    Calon(
        nomorUrut: '#1',
        namaCapres: 'AAAA',
        namaCawapres: 'bbbb',
        keterangan: 'ccccc'
    ),
    Calon(
        nomorUrut: '#2',
        namaCapres: 'AAAA',
        namaCawapres: 'bbbb',
        keterangan: 'ccccc'
    ),
    Calon(
        nomorUrut: '#3',
        namaCapres: 'AAAA',
        namaCawapres: 'bbbb',
        keterangan: 'ccccc'
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '17 FEBRUARI 2024',
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: Container(
            height: 1,
            color: Colors.black.withOpacity(1),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: calon.length,
                itemBuilder: (context, index) => myTile(
                    calon: calon[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
