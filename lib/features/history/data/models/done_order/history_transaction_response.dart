import 'dart:convert';

List<HistoryTransactionResponse> riwayatTransaksiResponseFromJson(String str) =>
    List<HistoryTransactionResponse>.from(
        json.decode(str).map((x) => HistoryTransactionResponse.fromJson(x)));

String riwayatTransaksiResponseToJson(List<HistoryTransactionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryTransactionResponse {
  final String? invoice;
  final String? payment;
  final String? pemesanan;
  final bool? takeaway;
  final String? status;
  final int? pelangganId;
  final int? mitraId;
  final dynamic antrianId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Oderlist>? oderlist;
  final Pelanggan? pelanggan;
  final Antrian? antrian;

  HistoryTransactionResponse({
    this.invoice,
    this.payment,
    this.pemesanan,
    this.takeaway,
    this.status,
    this.pelangganId,
    this.mitraId,
    this.antrianId,
    this.createdAt,
    this.updatedAt,
    this.oderlist,
    this.pelanggan,
    this.antrian,
  });

  factory HistoryTransactionResponse.fromJson(Map<String, dynamic> json) =>
      HistoryTransactionResponse(
        invoice: json["invoice"],
        payment: json["payment"],
        pemesanan: json["pemesanan"],
        takeaway: json["takeaway"],
        status: json["status"],
        pelangganId: json["pelangganId"],
        mitraId: json["mitraId"],
        antrianId: json["antrianId"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        oderlist: json["oderlist"] == null
            ? []
            : List<Oderlist>.from(
                json["oderlist"]!.map((x) => Oderlist.fromJson(x))),
        pelanggan: json["pelanggan"] == null
            ? null
            : Pelanggan.fromJson(json["pelanggan"]),
        antrian:
            json["antrian"] == null ? null : Antrian.fromJson(json["antrian"]),
      );

  Map<String, dynamic> toJson() => {
        "invoice": invoice,
        "payment": payment,
        "pemesanan": pemesanan,
        "takeaway": takeaway,
        "status": status,
        "pelangganId": pelangganId,
        "mitraId": mitraId,
        "antrianId": antrianId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "oderlist": oderlist == null
            ? []
            : List<dynamic>.from(oderlist!.map((x) => x.toJson())),
        "pelanggan": pelanggan?.toJson(),
        "antrian": antrian?.toJson(),
      };
}

class Antrian {
  final int? id;
  final int? estimasi;
  final String? orderstatus;
  final String? pesananId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Antrian({
    this.id,
    this.estimasi,
    this.orderstatus,
    this.pesananId,
    this.createdAt,
    this.updatedAt,
  });

  factory Antrian.fromJson(Map<String, dynamic> json) => Antrian(
        id: json["id"],
        estimasi: json["estimasi"],
        orderstatus: json["orderstatus"],
        pesananId: json["pesananId"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estimasi": estimasi,
        "orderstatus": orderstatus,
        "pesananId": pesananId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Oderlist {
  final int? id;
  final int? quantity;
  final String? note;
  final int? produkId;
  final String? pesananId;
  final Produk? produk;

  Oderlist({
    this.id,
    this.quantity,
    this.note,
    this.produkId,
    this.pesananId,
    this.produk,
  });

  factory Oderlist.fromJson(Map<String, dynamic> json) => Oderlist(
        id: json["id"],
        quantity: json["quantity"],
        note: json["note"],
        produkId: json["produkId"],
        pesananId: json["pesananId"],
        produk: json["produk"] == null ? null : Produk.fromJson(json["produk"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "note": note,
        "produkId": produkId,
        "pesananId": pesananId,
        "produk": produk?.toJson(),
      };
}

class Produk {
  final int? id;
  final String? namaProduk;
  final String? deskripsiProduk;
  final int? harga;
  final String? gambar;
  final int? kuantitas;
  final int? mitraId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Produk({
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

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        namaProduk: json["nama_produk"],
        deskripsiProduk: json["deskripsi_produk"],
        harga: json["harga"],
        gambar: json["gambar"],
        kuantitas: json["kuantitas"],
        mitraId: json["mitraId"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_produk": namaProduk,
        "deskripsi_produk": deskripsiProduk,
        "harga": harga,
        "gambar": gambar,
        "kuantitas": kuantitas,
        "mitraId": mitraId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Pelanggan {
  final int? id;
  final String? username;
  final String? password;
  final String? email;
  final bool? emailVerified;
  final String? profilePicture;
  final String? nama;
  final String? handphone;
  final String? alamat;
  final int? wallet;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Pelanggan({
    this.id,
    this.username,
    this.password,
    this.email,
    this.emailVerified,
    this.profilePicture,
    this.nama,
    this.handphone,
    this.alamat,
    this.wallet,
    this.createdAt,
    this.updatedAt,
  });

  factory Pelanggan.fromJson(Map<String, dynamic> json) => Pelanggan(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        profilePicture: json["profile_picture"],
        nama: json["nama"],
        handphone: json["handphone"],
        alamat: json["alamat"],
        wallet: json["wallet"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "emailVerified": emailVerified,
        "profile_picture": profilePicture,
        "nama": nama,
        "handphone": handphone,
        "alamat": alamat,
        "wallet": wallet,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
