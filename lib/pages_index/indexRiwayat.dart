class riwayat {
  String? tanggal;
  String? idTransaksi;
  String? idUser;
  String? totalHarga;
  String? status;

  riwayat(
      {this.tanggal,
      this.idTransaksi,
      this.idUser,
      this.totalHarga,
      this.status});

  riwayat.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    idTransaksi = json['id_transaksi'];
    idUser = json['id_user'];
    totalHarga = json['total_harga'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal'] = this.tanggal;
    data['id_transaksi'] = this.idTransaksi;
    data['id_user'] = this.idUser;
    data['total_harga'] = this.totalHarga;
    data['status'] = this.status;
    return data;
  }
}
