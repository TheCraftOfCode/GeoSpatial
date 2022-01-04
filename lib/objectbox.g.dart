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
      lastPropertyId: const IdUid(10, 2008589073662093950),
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
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(3, 371184347085100722),
            name: 'individualDataList',
            targetId: const IdUid(4, 8671447701453785879))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 8671447701453785879),
      name: 'FamilyMemberIndividualDataModel',
      lastPropertyId: const IdUid(31, 1397399115057201044),
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
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3085664632559939021),
            name: 'dateOfBirth',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4089981874949227093),
            name: 'gender',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8147924758541863603),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8362247275532978895),
            name: 'educationQualification',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5679091799904005563),
            name: 'aadhaarNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 93176754199097596),
            name: 'vulnerabilities',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 6683743346766211386),
            name: 'occupation',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 7674773686375268308),
            name: 'dailyWageWorker',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 3825178531183591336),
            name: 'incomePerDay',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 6800080566226023846),
            name: 'incomePerMonth',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 6682636002341351132),
            name: 'pension',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 5889517609383333513),
            name: 'businessStatus',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 1551885345947737655),
            name: 'maritalStatus',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 7362378614402948609),
            name: 'specialSkills',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 8079660499990560077),
            name: 'frequentAilments',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(19, 4413374908120023856),
            name: 'commutableDisease',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(20, 4250702923463112078),
            name: 'nonCommutableDisease',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(21, 1237433258990716055),
            name: 'surgeries',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(22, 6965476731638035450),
            name: 'anganwadiServicesAware',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(23, 4550221857104463869),
            name: 'anganwadiServicesUsing',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(24, 9085531839818427243),
            name: 'anganwadiServicesUsedList',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(25, 6866114763519136439),
            name: 'PHCServicesUsedList',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(26, 4835734038831150727),
            name: 'privateClinicServicesUsedList',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(27, 4667157897046339139),
            name: 'privateServiceReason',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(28, 3779166862225991045),
            name: 'useOfTobacco',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(29, 3268788816803461695),
            name: 'useOfAlcohol',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(30, 4255114771534059896),
            name: 'aarogyaSetuInstalled',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(31, 1397399115057201044),
            name: 'vizhithiruInstalled',
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
      lastRelationId: const IdUid(3, 371184347085100722),
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
        635977564128467162,
        7198889010838595583,
        2008589073662093950
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
            toManyRelations: (FamilyMembersCommonDataModel object) => {
                  RelInfo<FamilyMembersCommonDataModel>.toMany(3, object.id):
                      object.individualDataList
                },
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
              fbb.startTable(11);
              fbb.addInt64(0, object.id);
              fbb.addOffset(3, savedTimeOffset);
              fbb.addOffset(4, dbLocationTopLeftOffset);
              fbb.addOffset(5, dbLocationTopRightOffset);
              fbb.addOffset(6, dbLocationBottomLeftOffset);
              fbb.addOffset(7, dbLocationBottomRightOffset);
              fbb.finish(fbb.endTable());
              return object.id;
            },
            objectFromFB: (Store store, ByteData fbData) {
              final buffer = fb.BufferContext(fbData);
              final rootOffset = buffer.derefObject(0);

              final object = FamilyMembersCommonDataModel()
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
              InternalToManyAccess.setRelInfo(
                  object.individualDataList,
                  store,
                  RelInfo<FamilyMembersCommonDataModel>.toMany(3, object.id),
                  store.box<FamilyMembersCommonDataModel>());
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
          final dateOfBirthOffset = object.dateOfBirth == null
              ? null
              : fbb.writeString(object.dateOfBirth!);
          final genderOffset =
              object.gender == null ? null : fbb.writeString(object.gender!);
          final phoneNumberOffset = object.phoneNumber == null
              ? null
              : fbb.writeString(object.phoneNumber!);
          final educationQualificationOffset =
              object.educationQualification == null
                  ? null
                  : fbb.writeString(object.educationQualification!);
          final aadhaarNumberOffset = object.aadhaarNumber == null
              ? null
              : fbb.writeString(object.aadhaarNumber!);
          final vulnerabilitiesOffset = object.vulnerabilities == null
              ? null
              : fbb.writeList(object.vulnerabilities!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final occupationOffset = object.occupation == null
              ? null
              : fbb.writeList(object.occupation!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final dailyWageWorkerOffset = object.dailyWageWorker == null
              ? null
              : fbb.writeString(object.dailyWageWorker!);
          final incomePerDayOffset = object.incomePerDay == null
              ? null
              : fbb.writeString(object.incomePerDay!);
          final incomePerMonthOffset = object.incomePerMonth == null
              ? null
              : fbb.writeString(object.incomePerMonth!);
          final pensionOffset =
              object.pension == null ? null : fbb.writeString(object.pension!);
          final businessStatusOffset = object.businessStatus == null
              ? null
              : fbb.writeString(object.businessStatus!);
          final maritalStatusOffset = object.maritalStatus == null
              ? null
              : fbb.writeString(object.maritalStatus!);
          final specialSkillsOffset = object.specialSkills == null
              ? null
              : fbb.writeList(object.specialSkills!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final frequentAilmentsOffset = object.frequentAilments == null
              ? null
              : fbb.writeList(object.frequentAilments!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final commutableDiseaseOffset = object.commutableDisease == null
              ? null
              : fbb.writeList(object.commutableDisease!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final nonCommutableDiseaseOffset = object.nonCommutableDisease == null
              ? null
              : fbb.writeList(object.nonCommutableDisease!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final surgeriesOffset = object.surgeries == null
              ? null
              : fbb.writeString(object.surgeries!);
          final anganwadiServicesAwareOffset =
              object.anganwadiServicesAware == null
                  ? null
                  : fbb.writeString(object.anganwadiServicesAware!);
          final anganwadiServicesUsingOffset =
              object.anganwadiServicesUsing == null
                  ? null
                  : fbb.writeString(object.anganwadiServicesUsing!);
          final anganwadiServicesUsedListOffset =
              object.anganwadiServicesUsedList == null
                  ? null
                  : fbb.writeList(object.anganwadiServicesUsedList!
                      .map(fbb.writeString)
                      .toList(growable: false));
          final PHCServicesUsedListOffset = object.PHCServicesUsedList == null
              ? null
              : fbb.writeList(object.PHCServicesUsedList!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final privateClinicServicesUsedListOffset =
              object.privateClinicServicesUsedList == null
                  ? null
                  : fbb.writeList(object.privateClinicServicesUsedList!
                      .map(fbb.writeString)
                      .toList(growable: false));
          final privateServiceReasonOffset = object.privateServiceReason == null
              ? null
              : fbb.writeString(object.privateServiceReason!);
          final useOfTobaccoOffset = object.useOfTobacco == null
              ? null
              : fbb.writeString(object.useOfTobacco!);
          final useOfAlcoholOffset = object.useOfAlcohol == null
              ? null
              : fbb.writeString(object.useOfAlcohol!);
          final aarogyaSetuInstalledOffset = object.aarogyaSetuInstalled == null
              ? null
              : fbb.writeString(object.aarogyaSetuInstalled!);
          final vizhithiruInstalledOffset = object.vizhithiruInstalled == null
              ? null
              : fbb.writeString(object.vizhithiruInstalled!);
          fbb.startTable(32);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, userNameOffset);
          fbb.addOffset(2, savedTimeOffset);
          fbb.addOffset(3, dateOfBirthOffset);
          fbb.addOffset(4, genderOffset);
          fbb.addOffset(5, phoneNumberOffset);
          fbb.addOffset(6, educationQualificationOffset);
          fbb.addOffset(7, aadhaarNumberOffset);
          fbb.addOffset(8, vulnerabilitiesOffset);
          fbb.addOffset(9, occupationOffset);
          fbb.addOffset(10, dailyWageWorkerOffset);
          fbb.addOffset(11, incomePerDayOffset);
          fbb.addOffset(12, incomePerMonthOffset);
          fbb.addOffset(13, pensionOffset);
          fbb.addOffset(14, businessStatusOffset);
          fbb.addOffset(15, maritalStatusOffset);
          fbb.addOffset(16, specialSkillsOffset);
          fbb.addOffset(17, frequentAilmentsOffset);
          fbb.addOffset(18, commutableDiseaseOffset);
          fbb.addOffset(19, nonCommutableDiseaseOffset);
          fbb.addOffset(20, surgeriesOffset);
          fbb.addOffset(21, anganwadiServicesAwareOffset);
          fbb.addOffset(22, anganwadiServicesUsingOffset);
          fbb.addOffset(23, anganwadiServicesUsedListOffset);
          fbb.addOffset(24, PHCServicesUsedListOffset);
          fbb.addOffset(25, privateClinicServicesUsedListOffset);
          fbb.addOffset(26, privateServiceReasonOffset);
          fbb.addOffset(27, useOfTobaccoOffset);
          fbb.addOffset(28, useOfAlcoholOffset);
          fbb.addOffset(29, aarogyaSetuInstalledOffset);
          fbb.addOffset(30, vizhithiruInstalledOffset);
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
            ..savedTime =
                const fb.StringReader().vTableGetNullable(buffer, rootOffset, 8)
            ..dateOfBirth = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 10)
            ..gender = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 12)
            ..phoneNumber = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 14)
            ..educationQualification = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 16)
            ..aadhaarNumber = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 18)
            ..vulnerabilities =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 20)
            ..occupation =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 22)
            ..dailyWageWorker = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 24)
            ..incomePerDay = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 26)
            ..incomePerMonth = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 28)
            ..pension = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 30)
            ..businessStatus = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 32)
            ..maritalStatus = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 34)
            ..specialSkills =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 36)
            ..frequentAilments =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 38)
            ..commutableDisease =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 40)
            ..nonCommutableDisease =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 42)
            ..surgeries = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 44)
            ..anganwadiServicesAware = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 46)
            ..anganwadiServicesUsing = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 48)
            ..anganwadiServicesUsedList =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 50)
            ..PHCServicesUsedList =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 52)
            ..privateClinicServicesUsedList =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 54)
            ..privateServiceReason = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 56)
            ..useOfTobacco = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 58)
            ..useOfAlcohol = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 60)
            ..aarogyaSetuInstalled = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 62)
            ..vizhithiruInstalled = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 64);

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

  /// see [FamilyMembersCommonDataModel.individualDataList]
  static final individualDataList = QueryRelationToMany<
      FamilyMembersCommonDataModel,
      FamilyMemberIndividualDataModel>(_entities[1].relations[0]);
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

  /// see [FamilyMemberIndividualDataModel.dateOfBirth]
  static final dateOfBirth =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[3]);

  /// see [FamilyMemberIndividualDataModel.gender]
  static final gender = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[2].properties[4]);

  /// see [FamilyMemberIndividualDataModel.phoneNumber]
  static final phoneNumber =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[5]);

  /// see [FamilyMemberIndividualDataModel.educationQualification]
  static final educationQualification =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[6]);

  /// see [FamilyMemberIndividualDataModel.aadhaarNumber]
  static final aadhaarNumber =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[7]);

  /// see [FamilyMemberIndividualDataModel.vulnerabilities]
  static final vulnerabilities =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[8]);

  /// see [FamilyMemberIndividualDataModel.occupation]
  static final occupation =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[9]);

  /// see [FamilyMemberIndividualDataModel.dailyWageWorker]
  static final dailyWageWorker =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[10]);

  /// see [FamilyMemberIndividualDataModel.incomePerDay]
  static final incomePerDay =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[11]);

  /// see [FamilyMemberIndividualDataModel.incomePerMonth]
  static final incomePerMonth =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[12]);

  /// see [FamilyMemberIndividualDataModel.pension]
  static final pension = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[2].properties[13]);

  /// see [FamilyMemberIndividualDataModel.businessStatus]
  static final businessStatus =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[14]);

  /// see [FamilyMemberIndividualDataModel.maritalStatus]
  static final maritalStatus =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[15]);

  /// see [FamilyMemberIndividualDataModel.specialSkills]
  static final specialSkills =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[16]);

  /// see [FamilyMemberIndividualDataModel.frequentAilments]
  static final frequentAilments =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[17]);

  /// see [FamilyMemberIndividualDataModel.commutableDisease]
  static final commutableDisease =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[18]);

  /// see [FamilyMemberIndividualDataModel.nonCommutableDisease]
  static final nonCommutableDisease =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[19]);

  /// see [FamilyMemberIndividualDataModel.surgeries]
  static final surgeries = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[2].properties[20]);

  /// see [FamilyMemberIndividualDataModel.anganwadiServicesAware]
  static final anganwadiServicesAware =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[21]);

  /// see [FamilyMemberIndividualDataModel.anganwadiServicesUsing]
  static final anganwadiServicesUsing =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[22]);

  /// see [FamilyMemberIndividualDataModel.anganwadiServicesUsedList]
  static final anganwadiServicesUsedList =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[23]);

  /// see [FamilyMemberIndividualDataModel.PHCServicesUsedList]
  static final PHCServicesUsedList =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[24]);

  /// see [FamilyMemberIndividualDataModel.privateClinicServicesUsedList]
  static final privateClinicServicesUsedList =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[25]);

  /// see [FamilyMemberIndividualDataModel.privateServiceReason]
  static final privateServiceReason =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[26]);

  /// see [FamilyMemberIndividualDataModel.useOfTobacco]
  static final useOfTobacco =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[27]);

  /// see [FamilyMemberIndividualDataModel.useOfAlcohol]
  static final useOfAlcohol =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[28]);

  /// see [FamilyMemberIndividualDataModel.aarogyaSetuInstalled]
  static final aarogyaSetuInstalled =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[29]);

  /// see [FamilyMemberIndividualDataModel.vizhithiruInstalled]
  static final vizhithiruInstalled =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[2].properties[30]);
}
