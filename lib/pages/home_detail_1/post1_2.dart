import 'package:flutter/material.dart';

class Post1_2 extends StatelessWidget {
  const Post1_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          const Text(
            'H. Anies Rasyid Baswedan, S.E., M.P.P., Ph.D.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tempat Lahir : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Kuningan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tanggal Lahir : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '07 Mei 1969',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Usia : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '53 Tahun',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Agama : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Islam',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Istri : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Fery Farhati Ganis',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Anak :\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' 1. Mutiara Annisa Baswedan\n'
                          ' 2. Mikail Azizi Baswedan\n'
                          ' 3. Kaisar Hakam Baswedan\n'
                          ' 4. Ismail Hakim Baswedan\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Riwayat Pendidikan :\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '- SD Laboratori Yogyakarta\n'
                          '- SMPN 5 Yogyakarta\n'
                          '- SMAN 2 Yogyakarta\n'
                          '- Studi Asia di Universitas Shopia, Tokyo, Jepang (1993)\n'
                          '- S1 Fakultas Ekonomi UGM, Yogyakarta (1995)\n'
                          '- S2 di Universitas Maryland, College Park, Amerika Serikat (1998)\n'
                          '- S3 di Northern Illinois University, Amerika Serikat (2004)\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Riwayat Pekerjaan :\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: '- Rektor di Universitas Paramadina (2007)\n '
                          '- Menteri Pendidikan dan Kebudayaan dalam Kabinet Kerja (2014–2016)\n'
                          '- Gubernur DKI Jakarta (2017–2022)\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
