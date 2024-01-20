class Calon{
  String nomorUrut;
  String namaCapres;
  String namaCawapres;
  String imagePath;
  String koalisi;

  Calon({
    required this.nomorUrut,
    required this.namaCapres,
    required this.namaCawapres,
    required this.imagePath,
    required this.koalisi,
  });

  String get _nomorUrut => nomorUrut;
  String get _namaCapres => namaCapres;
  String get _namaCawapres => namaCawapres;
  String get _imagePath => imagePath;
  String get _koalisi => koalisi;
}