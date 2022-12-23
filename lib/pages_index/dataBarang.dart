class dataBarangTulis {
  String? idBarang;
  String? fotoBarang;
  String? namaBarang;
  String? kategori;
  String? harga;

  dataBarangTulis(
      {this.idBarang,
      this.fotoBarang,
      this.namaBarang,
      this.kategori,
      this.harga});

  dataBarangTulis.fromJson(Map<String, dynamic> json) {
    idBarang = json['id_barang'];
    fotoBarang = json['foto_barang'];
    namaBarang = json['nama_barang'];
    kategori = json['kategori'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_barang'] = this.idBarang;
    data['foto_barang'] = this.fotoBarang;
    data['nama_barang'] = this.namaBarang;
    data['kategori'] = this.kategori;
    data['harga'] = this.harga;
    return data;
  }
}

class dataBarangUkur {
  String? idBarang;
  String? fotoBarang;
  String? namaBarang;
  String? kategori;
  String? harga;

  dataBarangUkur(
      {this.idBarang,
      this.fotoBarang,
      this.namaBarang,
      this.kategori,
      this.harga});

  dataBarangUkur.fromJson(Map<String, dynamic> json) {
    idBarang = json['id_barang'];
    fotoBarang = json['foto_barang'];
    namaBarang = json['nama_barang'];
    kategori = json['kategori'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_barang'] = this.idBarang;
    data['foto_barang'] = this.fotoBarang;
    data['nama_barang'] = this.namaBarang;
    data['kategori'] = this.kategori;
    data['harga'] = this.harga;
    return data;
  }
}