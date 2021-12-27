// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'Model/CommunityDataModel.dart';
import 'Model/FamilyMembersCommomDataModel.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8881235461456447261),
      name: 'CommunityDataModel',
      lastPropertyId: const IdUid(8, 2203659096246358776),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8191075196018249341),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8796057529052012615),
            name: 'resourceType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3649664257574360958),
            name: 'villageCode',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6797539933900877027),
            name: 'dbLocationTopLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8489064245075560644),
            name: 'dbLocationTopRight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4981340637280440404),
            name: 'dbLocationBottomLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8742277346966043541),
            name: 'dbLocationBottomRight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2203659096246358776),
            name: 'savedTime',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 1860532570098563020),
      name: 'FamilyMembersCommonDataModel',
      lastPropertyId: const IdUid(9, 7198889010838595583),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3824533233190172585),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(4, 681931444274282409),
            name: 'savedTime',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6877689796308970604),
            name: 'dbLocationTopLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 6532623860122744430),
            name: 'dbLocationTopRight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 5378615026726072333),
            name: 'dbLocationBottomLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 4682325687318046173),
            name: 'dbLocationBottomRight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 7198889010838595583),
            name: 'keys',
            type: 23,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 8671447701453785879),
      name: 'FamilyMemberIndividualDataModel',
      lastPropertyId: const IdUid(3, 4526862708267238768),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5357433056362681420),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8011747133305154139),
            name: 'userName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4526862708267238768),
            name: 'savedTime',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(4, 8671447701453785879),
      lastIndexId: const IdUid(2, 3780641643474411567),
      lastRelationId: const IdUid(2, 991746608797753194),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [2384522976899313648],
      retiredIndexUids: const [8834613087270691234, 3780641643474411567],
      retiredPropertyUids: const [
        1796312536826265865,
        4138361640658468836,
        4718953437214788922,
        8052215135369744546,
        2435262721668243080,
        5992078344277508825,
        2398616950182668401,
        635977564128467162
      ],
      retiredRelationUids: const [7533083279143375120, 991746608797753194],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    CommunityDataModel: EntityDefinition<CommunityDataModel>(
        model: _entities[0],
        toOneRelations: (CommunityDataModel object) => [],
        toManyRelations: (CommunityDataModel object) => {},
        getId: (CommunityDataModel object) => object.id,
        setId: (CommunityDataModel object, int id) {
          object.id = id;
        },
        objectToFB: (CommunityDataModel object, fb.Builder fbb) {
          final resourceTypeOffset = object.resourceType == null
              ? null
              : fbb.writeString(object.resourceType!);
          final villageCodeOffset = object.villageCode == null
              ? null
              : fbb.writeString(object.villageCode!);
          final dbLocationTopLeftOffset = object.dbLocationTopLeft == null
              ? null
              : fbb.writeString(object.dbLocationTopLeft!);
          final dbLocationTopRightOffset = object.dbLocationTopRight == null
              ? null
              : fbb.writeString(object.dbLocationTopRight!);
          final dbLocationBottomLeftOffset = object.dbLocationBottomLeft == null
              ? null
              : fbb.writeString(object.dbLocationBottomLeft!);
          final dbLocationBottomRightOffset =
              object.dbLocationBottomRight == null
                  ? null
                  : fbb.writeString(object.dbLocationBottomRight!);
          final savedTimeOffset = object.savedTime == null
              ? null
              : fbb.writeString(object.savedTime!);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, resourceTypeOffset);
          fbb.addOffset(2, villageCodeOffset);
          fbb.addOffset(3, dbLocationTopLeftOffset);
          fbb.addOffset(4, dbLocationTopRightOffset);
          fbb.addOffset(5, dbLocationBottomLeftOffset);
          fbb.addOffset(6, dbLocationBottomRightOffset);
          fbb.addOffset(7, savedTimeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = CommunityDataModel(
              resourceType: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              villageCode: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..dbLocationTopLeft = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 10)
            ..dbLocationTopRight = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 12)
            ..dbLocationBottomLeft = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 14)
            ..dbLocationBottomRight = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 16)
            ..savedTime = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 18);

          return object;
        }),
    FamilyMembersCommonDataModel:
        EntityDefinition<FamilyMembersCommonDataModel>(
            model: _entities[1],
            toOneRelations: (FamilyMembersCommonDataModel object) => [],
            toManyRelations: (FamilyMembersCommonDataModel object) => {},
            getId: (FamilyMembersCommonDataModel object) => object.id,
            setId: (FamilyMembersCommonDataModel object, int id) {
              object.id = id;
            },
            objectToFB: (FamilyMembersCommonDataModel object, fb.Builder fbb) {
              final savedTimeOffset = object.savedTime == null
                  ? null
                  : fbb.writeString(object.savedTime!);
              final dbLocationTopLeftOffset = object.dbLocationTopLeft == null
                  ? null
                  : fbb.writeString(object.dbLocationTopLeft!);
              final dbLocationTopRightOffset = object.dbLocationTopRight == null
                  ? null
                  : fbb.writeString(object.dbLocationTopRight!);
              final dbLocationBottomLeftOffset =
                  object.dbLocationBottomLeft == null
                      ? null
                      : fbb.writeString(object.dbLocationBottomLeft!);
              final dbLocationBottomRightOffset =
                  object.dbLocationBottomRight == null
                      ? null
                      : fbb.writeString(object.dbLocationBottomRight!);
              final keysOffset =
                  object.keys == null ? null : fbb.writeListInt8(object.keys!);
              fbb.startTable(10);
              fbb.addInt64(0, object.id);
              fbb.addOffset(3, savedTimeOffset);
              fbb.addOffset(4, dbLocationTopLeftOffset);
              fbb.addOffset(5, dbLocationTopRightOffset);
              fbb.addOffset(6, dbLocationBottomLeftOffset);
              fbb.addOffset(7, dbLocationBottomRightOffset);
              fbb.addOffset(8, keysOffset);
              fbb.finish(fbb.endTable());
              return object.id;
            },
            objectFromFB: (Store store, ByteData fbData) {
              final buffer = fb.BufferContext(fbData);
              final rootOffset = buffer.derefObject(0);

              final object = FamilyMembersCommonDataModel(
                  keys: const fb.ListReader<int>(fb.Int8Reader(), lazy: false)
                      .vTableGetNullable(buffer, rootOffset, 20))
                ..id =
                    const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
                ..savedTime = const fb.StringReader()
                    .vTableGetNullable(buffer, rootOffset, 10)
                ..dbLocationTopLeft = const fb.StringReader()
                    .vTableGetNullable(buffer, rootOffset, 12)
                ..dbLocationTopRight = const fb.StringReader()
                    .vTableGetNullable(buffer, rootOffset, 14)
                ..dbLocationBottomLeft = const fb.StringReader()
                    .vTableGetNullable(buffer, rootOffset, 16)
                ..dbLocationBottomRight = const fb.StringReader()
                    .vTableGetNullable(buffer, rootOffset, 18);

              return object;
            }),
    FamilyMemberIndividualDataModel: EntityDefinition<
            FamilyMemberIndividualDataModel>(
        model: _entities[2],
        toOneRelations: (FamilyMemberIndividualDataModel object) => [],
        toManyRelations: (FamilyMemberIndividualDataModel object) => {},
        getId: (FamilyMemberIndividualDataModel object) => object.id,
        setId: (FamilyMemberIndividualDataModel object, int id) {
          object.id = id;
        },
        objectToFB: (FamilyMemberIndividualDataModel object, fb.Builder fbb) {
          final userNameOffset = object.userName == null
              ? null
              : fbb.writeString(object.userName!);
          final savedTimeOffset = object.savedTime == null
              ? null
              : fbb.writeString(object.savedTime!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, userNameOffset);
          fbb.addOffset(2, savedTimeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = FamilyMemberIndividualDataModel(
              userName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..savedTime = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 8);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [CommunityDataModel] entity fields to define ObjectBox queries.
class CommunityDataModel_ {
  /// see [CommunityDataModel.id]
  static final id =
      QueryIntegerProperty<CommunityDataModel>(_entities[0].properties[0]);

  /// see [CommunityDataModel.resourceType]
  static final resourceType =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[1]);

  /// see [CommunityDataModel.villageCode]
  static final villageCode =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[2]);

  /// see [CommunityDataModel.dbLocationTopLeft]
  static final dbLocationTopLeft =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[3]);

  /// see [CommunityDataModel.dbLocationTopRight]
  static final dbLocationTopRight =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[4]);

  /// see [CommunityDataModel.dbLocationBottomLeft]
  static final dbLocationBottomLeft =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[5]);

  /// see [CommunityDataModel.dbLocationBottomRight]
  static final dbLocationBottomRight =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[6]);

  /// see [CommunityDataModel.savedTime]
  static final savedTime =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[7]);
}

/// [FamilyMembersCommonDataModel] entity fields to define ObjectBox queries.
class FamilyMembersCommonDataModel_ {
  /// see [FamilyMembersCommonDataModel.id]
  static final id = QueryIntegerProperty<FamilyMembersCommonDataModel>(
      _entities[1].properties[0]);

  /// see [FamilyMembersCommonDataModel.savedTime]
  static final savedTime = QueryStringProperty<FamilyMembersCommonDataModel>(
      _entities[1].properties[1]);

  /// see [FamilyMembersCommonDataModel.dbLocationTopLeft]
  static final dbLocationTopLeft =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[1].properties[2]);

  /// see [FamilyMembersCommonDataModel.dbLocationTopRight]
  static final dbLocationTopRight =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[1].properties[3]);

  /// see [FamilyMembersCommonDataModel.dbLocationBottomLeft]
  static final dbLocationBottomLeft =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[1].properties[4]);

  /// see [FamilyMembersCommonDataModel.dbLocationBottomRight]
  static final dbLocationBottomRight =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[1].properties[5]);

  /// see [FamilyMembersCommonDataModel.keys]
  static final keys = QueryByteVectorProperty<FamilyMembersCommonDataModel>(
      _entities[1].properties[6]);
}

/// [FamilyMemberIndividualDataModel] entity fields to define ObjectBox queries.
class FamilyMemberIndividualDataModel_ {
  /// see [FamilyMemberIndividualDataModel.id]
  static final id = QueryIntegerProperty<FamilyMemberIndividualDataModel>(
      _entities[2].properties[0]);

  /// see [FamilyMemberIndividualDataModel.userName]
  static final userName = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[2].properties[1]);

  /// see [FamilyMemberIndividualDataModel.savedTime]
  static final savedTime = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[2].properties[2]);
}
