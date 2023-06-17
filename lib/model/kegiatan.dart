class Kegiatan {
  String? id;
  String? judul;
  String? jenis;
  String? deskripsi;
  String? tanggal;
  String? jam;  
  String? tempat;  
  String? nama_pnt;
  String? no_idn;
  String? jenis_kelamin;  
  String? status;

  Kegiatan({
    this.id,
    this.judul,
    this.jenis,
    this.deskripsi,
    this.tanggal,
    this.jam,
    this.tempat,
    this.nama_pnt,
    this.no_idn,
    this.jenis_kelamin,
    this.status,
  });

  factory Kegiatan.fromJson(Map<String, dynamic> json) => Kegiatan(
        id: json['id'],
        judul: json['judul'],
        jenis: json['jenis'],
        deskripsi: json['deskripsi'],
        tanggal: json['tanggal'],
        jam: json['jam'],
        tempat: json['tempat'],
        nama_pnt: json['nama_pnt'],
        no_idn: json['no_idn'],
        jenis_kelamin: json['jenis_kelamin'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'jenis': jenis,
        'deskripsi': deskripsi,
        'tanggal': tanggal,
        'jam': jam,
        'tempat': tempat,
        'nama_pnt': nama_pnt,
        'no_idn': no_idn,
        'jenis_kelamin': jenis_kelamin,
        'status': status,
      };
}
