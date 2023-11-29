class Calon{
  String nomorUrut;
  String namaCapres;
  String namaCawapres;
  String keterangan;
  //String imagePath;

  Calon({
    required this.nomorUrut,
    required this.namaCapres,
    required this.namaCawapres,
    required this.keterangan,
  });

  String get _nomorUrut => nomorUrut;
  String get _namaCapres => namaCapres;
  String get _namaCawapres => namaCawapres;
  String get _keterangan => keterangan;
}