import 'package:flutter/material.dart';

class Post3_3 extends StatelessWidget {
  const Post3_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text(
            'Prof. Dr. Mohammad Mahfud MD, S.H., S.U., M.I.P.',
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
                      text: 'Sampang',
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
                      text: '13 Mei 1957',
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
                      text: '66 Tahun',
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
                      text: 'Hj. Zaizatun Nihayati, S.H.',
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
                      text: ' 1. Mohammad Ikhwan Zein\n'
                          ' 2. dr. Vina Amalia, Sp.KFR., M.Ked.Klin.\n'
                          'Royhan Akbar',
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
                      text: '- SDN Waru Pamekasan Madura\n'
                          '- Sarjana Hukum Tata Negara, Universitas Islam Indonesia Yogyakarta\n'
                          '- Sarjana Sastra Arab, Universitas Gadjah Mada Yogyakarta\n'
                          '- Magister Ilmu Politik, Universitas Gadjah Mada Yogyakarta\n'
                          '- Doktor Ilmu Hukum Tata Negara, Universitas Gadjah Mada Yogyakarta'
                          '- Profesor Hukum Tata Negara, Universitas Islam Indonesia Yogyakarta',
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

                      text: '- Wakil Ketua Umum Dewan Tanfidz DPP PKB (2002-2005)\n'
                          '- Rektor Universitas Islam Kadiri (2003-2006)\n'
                          '- Anggota DPR RI Komisi III (2004-2006)\n'
                          '- Anggota DPR RI Komisi I (2006-2007)\n'
                          '- Anggota DPR RI Komisi III (2007-2008)\n'
                          '- Ketua Badan Legislatif DPR RI (2007-2008)\n'
                          '- Ketua Mahkamah Konstitusi RI (2008-2013)\n'
                          '- Anggota Dewan Pengarah Unit Kerja Presiden Pembinaan ideologi Pancasila (2017-2018)\n'
                          '- Menteri Koordinator Bidang Politik, Hukum, dan Keamanan RI (2019-sekarang)\n ',
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
