// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npbpo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NPBPO _$NPBPOFromJson(Map<String, dynamic> json) => NPBPO(
      json['no'] as int,
      const MataPelajaranConverter()
          .fromJson(json['mapel'] as Map<String, dynamic>),
      json['presensi'] as String,
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$NPBPOToJson(NPBPO instance) => <String, dynamic>{
      'no': instance.no,
      'mapel': const MataPelajaranConverter().toJson(instance.pelajaran),
      'presensi': instance.presensi,
      'note': instance.note,
    };
