class MenuEntity {
  final int? id;
  final String? namaProduk;
  final String? deskripsiProduk;
  final int? harga;
  final String? gambar;
  final int? kuantitas;
  final int? mitraId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MenuEntity({
    this.id,
    this.namaProduk,
    this.deskripsiProduk,
    this.harga,
    this.gambar,
    this.kuantitas,
    this.mitraId,
    this.createdAt,
    this.updatedAt,
  });
}
