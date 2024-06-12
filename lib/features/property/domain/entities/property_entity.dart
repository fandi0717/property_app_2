import 'package:equatable/equatable.dart';

class PropertyEntity extends Equatable {
  const PropertyEntity({
    required this.property,
  });

  final List<Property> property;

  factory PropertyEntity.fromJson(Map<String, dynamic> json) {
    return PropertyEntity(
      property: json["property"] == null
          ? []
          : List<Property>.from(
              json["property"]!.map((x) => Property.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        property,
      ];
}

class Property extends Equatable {
  const Property({
    required this.id,
    required this.name,
    required this.location,
    required this.img,
    required this.deadlines,
    required this.price,
    required this.propertyType,
    required this.transaction,
    required this.currentDate,
    required this.fine,
  });

  final String? id;
  final String? name;
  final String? location;
  final String? img;
  final DateTime? deadlines;
  final double? price;
  final String? propertyType;
  final List<Transaction> transaction;
  final DateTime? currentDate;
  final double? fine;

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json["id"],
      name: json["name"],
      location: json["location"],
      img: json["img"],
      deadlines: DateTime.tryParse(json["deadlines"] ?? ""),
      price: json["price"],
      propertyType: json["property_type"],
      transaction: json["transaction"] == null
          ? []
          : List<Transaction>.from(
              json["transaction"]!.map((x) => Transaction.fromJson(x))),
      currentDate: DateTime.tryParse(json["current_date"] ?? ""),
      fine: json["fine"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        img,
        deadlines,
        price,
        propertyType,
        transaction,
        currentDate,
        fine,
      ];
}

class Transaction extends Equatable {
  const Transaction({
    required this.tahapPemesanan,
    required this.tahapAdministrasi,
    required this.tahapPembangunan,
    required this.tahapAkadSerahTerima,
  });

  final TahapPemesanan? tahapPemesanan;
  final TahapAdministrasi? tahapAdministrasi;
  final TahapPembangunan? tahapPembangunan;
  final TahapAkadSerahTerima? tahapAkadSerahTerima;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      tahapPemesanan: json["tahap_pemesanan"] == null
          ? null
          : TahapPemesanan.fromJson(json["tahap_pemesanan"]),
      tahapAdministrasi: json["tahap_administrasi"] == null
          ? null
          : TahapAdministrasi.fromJson(json["tahap_administrasi"]),
      tahapPembangunan: json["tahap_pembangunan"] == null
          ? null
          : TahapPembangunan.fromJson(json["tahap_pembangunan"]),
      tahapAkadSerahTerima: json["tahap_akad_serah_terima"] == null
          ? null
          : TahapAkadSerahTerima.fromJson(json["tahap_akad_serah_terima"]),
    );
  }

  @override
  List<Object?> get props => [
        tahapPemesanan,
        tahapAdministrasi,
        tahapPembangunan,
        tahapAkadSerahTerima,
      ];
}

class TahapAdministrasi extends Equatable {
  const TahapAdministrasi({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapAdministrasiMenu? menu;

  factory TahapAdministrasi.fromJson(Map<String, dynamic> json) {
    return TahapAdministrasi(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapAdministrasiMenu.fromJson(json["menu"]),
    );
  }

  @override
  List<Object?> get props => [
        progress,
        menu,
      ];
}

class TahapAdministrasiMenu extends Equatable {
  const TahapAdministrasiMenu({
    required this.tahapSps,
    required this.tahapSpr,
    required this.tahapPpjb,
    required this.daftarDokumen,
    required this.tahapSp3K,
    required this.bayarAngsuran,
  });

  final bool? tahapSps;
  final bool? tahapSpr;
  final bool? tahapPpjb;
  final bool? daftarDokumen;
  final bool? tahapSp3K;
  final bool? bayarAngsuran;

  factory TahapAdministrasiMenu.fromJson(Map<String, dynamic> json) {
    return TahapAdministrasiMenu(
      tahapSps: json["tahap_sps"],
      tahapSpr: json["tahap_spr"],
      tahapPpjb: json["tahap_ppjb"],
      daftarDokumen: json["daftar_dokumen"],
      tahapSp3K: json["tahap_sp3k"],
      bayarAngsuran: json["bayar_angsuran"],
    );
  }

  @override
  List<Object?> get props => [
        tahapSps,
        tahapSpr,
        tahapPpjb,
        daftarDokumen,
        tahapSp3K,
        bayarAngsuran,
      ];
}

class TahapAkadSerahTerima extends Equatable {
  const TahapAkadSerahTerima({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapAkadSerahTerimaMenu? menu;

  factory TahapAkadSerahTerima.fromJson(Map<String, dynamic> json) {
    return TahapAkadSerahTerima(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapAkadSerahTerimaMenu.fromJson(json["menu"]),
    );
  }

  @override
  List<Object?> get props => [
        progress,
        menu,
      ];
}

class TahapAkadSerahTerimaMenu extends Equatable {
  const TahapAkadSerahTerimaMenu({
    required this.tahapAkad,
    required this.tahapSerahTerimaBangunan,
    required this.tahapSerahTerimaLegalitas,
    required this.daftarKomplain,
  });

  final bool? tahapAkad;
  final bool? tahapSerahTerimaBangunan;
  final bool? tahapSerahTerimaLegalitas;
  final bool? daftarKomplain;

  factory TahapAkadSerahTerimaMenu.fromJson(Map<String, dynamic> json) {
    return TahapAkadSerahTerimaMenu(
      tahapAkad: json["tahap_akad"],
      tahapSerahTerimaBangunan: json["tahap_serah_terima_bangunan"],
      tahapSerahTerimaLegalitas: json["tahap_serah_terima_legalitas"],
      daftarKomplain: json["daftar_komplain"],
    );
  }

  @override
  List<Object?> get props => [
        tahapAkad,
        tahapSerahTerimaBangunan,
        tahapSerahTerimaLegalitas,
        daftarKomplain,
      ];
}

class TahapPembangunan extends Equatable {
  const TahapPembangunan({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapPembangunanMenu? menu;

  factory TahapPembangunan.fromJson(Map<String, dynamic> json) {
    return TahapPembangunan(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapPembangunanMenu.fromJson(json["menu"]),
    );
  }

  @override
  List<Object?> get props => [
        progress,
        menu,
      ];
}

class TahapPembangunanMenu extends Equatable {
  const TahapPembangunanMenu({
    required this.tahapPersiapan,
    required this.tahapPondasiStruktur,
    required this.tahapRumahUnfinished,
    required this.daftarFinishingInterior,
    required this.tahapPembersihan,
  });

  final double? tahapPersiapan;
  final double? tahapPondasiStruktur;
  final double? tahapRumahUnfinished;
  final double? daftarFinishingInterior;
  final double? tahapPembersihan;

  factory TahapPembangunanMenu.fromJson(Map<String, dynamic> json) {
    return TahapPembangunanMenu(
      tahapPersiapan: json["tahap_persiapan"],
      tahapPondasiStruktur: json["tahap_pondasi_struktur"],
      tahapRumahUnfinished: json["tahap_rumah_unfinished"],
      daftarFinishingInterior: json["daftar_finishing_interior"],
      tahapPembersihan: json["tahap_pembersihan"],
    );
  }

  @override
  List<Object?> get props => [
        tahapPersiapan,
        tahapPondasiStruktur,
        tahapRumahUnfinished,
        daftarFinishingInterior,
        tahapPembersihan,
      ];
}

class TahapPemesanan extends Equatable {
  const TahapPemesanan({
    required this.progress,
    required this.menu,
  });

  final double? progress;
  final TahapPemesananMenu? menu;

  factory TahapPemesanan.fromJson(Map<String, dynamic> json) {
    return TahapPemesanan(
      progress: json["progress"],
      menu: json["menu"] == null
          ? null
          : TahapPemesananMenu.fromJson(json["menu"]),
    );
  }

  @override
  List<Object?> get props => [
        progress,
        menu,
      ];
}

class TahapPemesananMenu extends Equatable {
  const TahapPemesananMenu({
    required this.bookingFee,
    required this.pesananBelumBayar,
    required this.riwayatPemesanan,
  });

  final int? bookingFee;
  final bool? pesananBelumBayar;
  final bool? riwayatPemesanan;

  factory TahapPemesananMenu.fromJson(Map<String, dynamic> json) {
    return TahapPemesananMenu(
      bookingFee: json["booking_fee"],
      pesananBelumBayar: json["pesanan_belum_bayar"],
      riwayatPemesanan: json["riwayat_pemesanan"],
    );
  }

  @override
  List<Object?> get props => [
        bookingFee,
        pesananBelumBayar,
        riwayatPemesanan,
      ];
}
