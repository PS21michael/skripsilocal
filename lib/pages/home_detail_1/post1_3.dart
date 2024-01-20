import 'package:flutter/material.dart';

class Post1_3 extends StatelessWidget {
  const Post1_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text(
            'Dr. (HC). A. Muhaimin Iskandar, M.Si.',
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
                      text: 'Jombang',
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
                      text: '24 September 1966',
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
                      text: '58 Tahun',
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
                      text: 'Hj. Rustini',
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
                      text: ' 1. Mega Safira\n'
                      ' 2. Rahma Arifa\n'
                      ' 3. Egalita Az-zahra\n',
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
                      text: '- SD Mambaul Ma’arif Denanyar Jombang (1976)\n'
                          '- SMP Mambaul Ma’arif Denanyar Jombang (1982)\n'
                          '- SMAN I Yogyakarta (1985)\n'
                          '- S1 Fisip Universitas Gadjah Mada (1991)\n'
                          '- S2 Manajemen Komunikasi Universitas Indonesia (1998-2001)\n'
                          '- S3 Universitas Airlangga (2018)\n',
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
                      text: '- Staff Pengajar Pesantren Denanyar Jombang (1980-1983)\n '
                          '- Kepala Divisi Penelitian LPU Jakarta (1992-1994)\n'
                          '- Ketua Umum PMII (1994-1997)\n'
                          '- Ketua FPKB DPR RI (1999)\n'
                          '- Anggota DPR RI (1999-2004)\n'
                          '- Wakil Ketua DPR RI (1999-2009)\n'
                          '- Ketua Dewan Tanfidziah DPP PKB (2002-2007)\n'
                          '- Sekretaris Jenderal DPP PKB (2004-2005)\n'
                          '- Menteri Tenaga Kerja dan Transmigrasi (2009-2014)\n'
                          '- Wakil Ketua MPR RI (2018-2019)\n'
                          '- Wakil Ketua DPR RI (2019-sekarang)\n'
                          '- Ketua Umum PKB (2005-sekarang)\n',
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
