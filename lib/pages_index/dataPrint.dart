class dataPrint {
  String? idPrint;
  String? jenisPrint;
  String? harga;

  dataPrint({this.idPrint, this.jenisPrint, this.harga});

  dataPrint.fromJson(Map<String, dynamic> json) {
    idPrint = json['id_print'];
    jenisPrint = json['jenis_print'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_print'] = this.idPrint;
    data['jenis_print'] = this.jenisPrint;
    data['harga'] = this.harga;
    return data;
  }
}