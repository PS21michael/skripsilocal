import 'package:flutter/material.dart';

class Post2_2 extends StatelessWidget {
  const Post2_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text(
            'Letnan Jenderal TNI (Purn) Prabowo Subianto Djojohadikusumo',
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
                text: TextSpan(
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
                      text: 'Jakarta',
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
                text: TextSpan(
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
                      text: '17 Oktober 1951',
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
                text: TextSpan(
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
                      text: '72 Tahun',
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
                text: TextSpan(
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
                text: TextSpan(
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
                      text: 'Siti Hediati Hariyadi (menikah tahun 1983–1998)',
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
                text: TextSpan(
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
                      text: ' 1. Ragowo Hediprasetyo Djojohadikusumo\n',
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
                text: TextSpan(
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
                      text: '- Elementary School (Hongkong)\n'
                          '- Victoria Institution (Malaysia)\n'
                          '- Zurich International School (Swiss)\n'
                          '- American School In London, United Kingdom (Inggris)\n'
                          '- AKABRI Magelang\n'
                          '- Sekolah Staf Dan Komando TNI-AD\n',
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
                text: TextSpan(
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
                      text: '- Komandan Peleton Grup Komando-1 Kopassandha (1976)\n '
                          '- Komandan Kompi Komando Grup-1 Kopassandha (1977)\n'
                          '- Wakil Komandan Detasemen-81 Kopassus (1983-1985)\n'
                          '- Wakil Komandan Batalyon Infanteri Lintas Udara Kostrad (1985-1987)\n'
                          '- Komandan Batalyon Infanteri Lintas Udara 328 Kostrad (1987-1991)\n'
                          '- Kepala Staf Brigade Infanteri Lintas Udara 17/Kujang I/Kostrad (1991-1993)\n'
                          '- Komandan Grup-3/pusat pelatihan Pasukan Khusus (1993-1995)\n'
                          '- Wakil Komandan Komando Pasukan Khusus (1994)\n'
                          '- Komandan Komando Pasukan Khusus (1995-1996)\n'
                          '- Panglima Komando Pasukan Khusus (1996-1998)\n'
                          '- Panglima Komando Cadangan Strategis Angkatan Darat (1998)\n'
                          '- Komandan Sekolah Staf dan Komando Angkatan Darat (1998)\n'
                          '- Ketua HKTI (2004-2009 &  2010-2015)\n'
                          '- Ketua Umum Partai Gerindra\n'
                          '- Menteri Kementerian Pertahanan (2019-sekarang)\n',
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
