
import 'package:equatable/equatable.dart';
import 'package:rapor_lc/data/models/nhb_model.dart';
import 'package:rapor_lc/data/models/nk_model.dart';
import 'package:rapor_lc/data/models/npbmo_model.dart';
import 'package:rapor_lc/data/models/npbpo_model.dart';
import 'package:rapor_lc/domain/entities/nhb.dart';
import 'package:rapor_lc/domain/entities/nk.dart';
import 'package:rapor_lc/domain/entities/npbpo.dart';
import 'package:rapor_lc/domain/entities/santri.dart';

class SantriModel extends Equatable {
  SantriModel({
    required this.nis,
    required this.nama,
    this.daftar_nhb,
    this.daftar_nk,
    this.npbmo,
    this.daftar_npbpo
  });

  final String nis;
  final String nama;
  List<NHBModel>? daftar_nhb;
  List<NKModel>? daftar_nk;
  NPBMOModel? npbmo;
  List<NPBPOModel>? daftar_npbpo;

  factory SantriModel.fromJson(Map<String, dynamic> json) => SantriModel(
    nis: json['nis'],
    nama: json['nama'],
    daftar_nhb: (json['nhbs'] as List)
        .map<NHBModel>((e) => NHBModel.fromJson(e)).toList(),
    daftar_nk: (json['nks'] as List)
        .map<NKModel>((e) => NKModel.fromJson(e)).toList(),
    npbmo: NPBMOModel.fromJson(json['npbmo']),
    daftar_npbpo: (json['npbpos'] as List)
        .map<NPBPOModel>((e) => NPBPOModel.fromJson(e)).toList()
  );

  Map<String, dynamic> toJson() => {
    'nis': nis,
    'nama': nama,
    'nhbs': daftar_nhb?.map<dynamic>((e) => e.toJson()).toList(),
    'nks': daftar_nk?.map<dynamic>((e) => e.toJson()).toList(),
    'npbmo': npbmo?.toJson(),
    'npbpos': daftar_npbpo?.map<dynamic>((e) => e.toJson()).toList()
  };
  
  Santri toEntity() => Santri(
      nis, nama,
      daftar_nhb: daftar_nhb?.map<NHB>((e) => e.toEntity()).toList(),
      daftar_nk: daftar_nk?.map<NK>((e) => e.toEntity()).toList(),
      npbmo: npbmo?.toEntity(),
      daftar_npbpo: daftar_npbpo?.map<NPBPO>((e) => e.toEntity()).toList()
  );

  @override
  List<Object?> get props => [nis, nama, daftar_nhb, daftar_nk, npbmo, daftar_npbpo];
}