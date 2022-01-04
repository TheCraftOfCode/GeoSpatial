// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'Model/CommunityDataModel.dart';
import 'Model/FamilyMembersCommonDataModel.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3950518272510391200),
      name: 'CommunityDataModel',
      lastPropertyId: const IdUid(8, 3170409840351111096),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8140527551961172548),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3159495043814331513),
            name: 'resourceType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4690970104335964894),
            name: 'villageCode',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5259334423703613736),
            name: 'savedTime',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5523993525315213267),
            name: 'dbLocationTopLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 9064650214124194157),
            name: 'dbLocationTopRight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2961799903689622576),
            name: 'dbLocationBottomLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3170409840351111096),
            name: 'dbLocationBottomRight',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6685214565457365230),
      name: 'FamilyMemberIndividualDataModel',
      lastPropertyId: const IdUid(32, 5375503589039401181),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8723352508613304168),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7604499542143584605),
            name: 'userName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6647327136270420131),
            name: 'dateOfBirth',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7394015767332678427),
            name: 'gender',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3884159339096887518),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3761785743139786223),
            name: 'educationQualification',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2912550153076040514),
            name: 'aadhaarNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 6501390621116148247),
            name: 'dailyWageWorker',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 8692285643353019146),
            name: 'incomePerDay',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 2510858921793217570),
            name: 'incomePerMonth',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 3831022645838678395),
            name: 'pension',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 1404325505572824726),
            name: 'businessStatus',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 7080052757140045670),
            name: 'maritalStatus',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 4439637978014416112),
            name: 'specialSkills',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 4636181569648235734),
            name: 'frequentAilments',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 4851875690128697657),
            name: 'commutableDisease',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 7484660082837778600),
            name: 'nonCommutableDisease',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 5729780143757895259),
            name: 'surgeries',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(19, 2532110693984905492),
            name: 'anganwadiServicesAware',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(20, 7268786638343194491),
            name: 'anganwadiServicesUsing',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(21, 6352333255560290159),
            name: 'anganwadiServicesUsedList',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(22, 3293166845575984244),
            name: 'PHCServicesUsedList',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(23, 2397114879954340884),
            name: 'privateClinicServicesUsedList',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(24, 3237947682147741066),
            name: 'privateServiceReason',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(25, 2630658762586974548),
            name: 'useOfTobacco',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(26, 1662798223273329088),
            name: 'useOfAlcohol',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(27, 3258249527595452242),
            name: 'aarogyaSetuInstalled',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(28, 8168820643425503335),
            name: 'vizhithiruInstalled',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(30, 3074524065493072391),
            name: 'savedTime',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(31, 7256338567008476068),
            name: 'dbVulnerabilities',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(32, 5375503589039401181),
            name: 'dbOccupation',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 5004688671325240296),
      name: 'FamilyMembersCommonDataModel',
      lastPropertyId: const IdUid(23, 6516827898200627863),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 406597506935878482),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5933268951084276983),
            name: 'drinkingWater',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7714255537633512426),
            name: 'sourceOfDrinkingWater',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2415808930190145187),
            name: 'toiletFacility',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4950161314722702905),
            name: 'communityToilet',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8384486349887445986),
            name: 'environmentSanitationLevel',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2392963229872898504),
            name: 'runningWaterAvailable',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3952912803449147993),
            name: 'noOfTwoWheelers',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 1669417226997886200),
            name: 'noOfThreeWheelers',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 5011624990870736391),
            name: 'noOfFourWheelers',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 8805489678700516176),
            name: 'isCattleOwned',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 8435942014491427702),
            name: 'incomeFromCattle',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 1694052736194978877),
            name: 'isFarmLandOwned',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 5615515454180248444),
            name: 'isSeedsPreserved',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 7655049526662030931),
            name: 'isKitchenGardenOwned',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 6193242875372395353),
            name: 'addressOne',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 1686900574402451883),
            name: 'addressTwo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 5524724872707357697),
            name: 'addressThree',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(19, 1423273990910471875),
            name: 'savedTime',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(20, 5507268764564482947),
            name: 'dbLocationTopLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(21, 4582363172019587389),
            name: 'dbLocationTopRight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(22, 69678934293790881),
            name: 'dbLocationBottomLeft',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(23, 6516827898200627863),
            name: 'dbLocationBottomRight',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 1791331254757937694),
            name: 'individualDataList',
            targetId: const IdUid(2, 6685214565457365230))
      ],
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
      lastEntityId: const IdUid(3, 5004688671325240296),
      lastIndexId: const IdUid(1, 7346081088137941172),
      lastRelationId: const IdUid(1, 1791331254757937694),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [7346081088137941172],
      retiredPropertyUids: const [1969777098633351831],
      retiredRelationUids: const [],
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
          final savedTimeOffset = object.savedTime == null
              ? null
              : fbb.writeString(object.savedTime!);
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
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, resourceTypeOffset);
          fbb.addOffset(2, villageCodeOffset);
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

          final object = CommunityDataModel(
              resourceType: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              villageCode: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
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
        model: _entities[1],
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
          final savedTimeOffset = object.savedTime == null
              ? null
              : fbb.writeString(object.savedTime!);
          final dbVulnerabilitiesOffset = object.dbVulnerabilities == null
              ? null
              : fbb.writeString(object.dbVulnerabilities!);
          final dbOccupationOffset = object.dbOccupation == null
              ? null
              : fbb.writeString(object.dbOccupation!);
          fbb.startTable(33);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, userNameOffset);
          fbb.addInt64(2, object.dateOfBirth?.millisecondsSinceEpoch);
          fbb.addOffset(3, genderOffset);
          fbb.addOffset(4, phoneNumberOffset);
          fbb.addOffset(5, educationQualificationOffset);
          fbb.addOffset(6, aadhaarNumberOffset);
          fbb.addOffset(7, dailyWageWorkerOffset);
          fbb.addOffset(8, incomePerDayOffset);
          fbb.addOffset(9, incomePerMonthOffset);
          fbb.addOffset(10, pensionOffset);
          fbb.addOffset(11, businessStatusOffset);
          fbb.addOffset(12, maritalStatusOffset);
          fbb.addOffset(13, specialSkillsOffset);
          fbb.addOffset(14, frequentAilmentsOffset);
          fbb.addOffset(15, commutableDiseaseOffset);
          fbb.addOffset(16, nonCommutableDiseaseOffset);
          fbb.addOffset(17, surgeriesOffset);
          fbb.addOffset(18, anganwadiServicesAwareOffset);
          fbb.addOffset(19, anganwadiServicesUsingOffset);
          fbb.addOffset(20, anganwadiServicesUsedListOffset);
          fbb.addOffset(21, PHCServicesUsedListOffset);
          fbb.addOffset(22, privateClinicServicesUsedListOffset);
          fbb.addOffset(23, privateServiceReasonOffset);
          fbb.addOffset(24, useOfTobaccoOffset);
          fbb.addOffset(25, useOfAlcoholOffset);
          fbb.addOffset(26, aarogyaSetuInstalledOffset);
          fbb.addOffset(27, vizhithiruInstalledOffset);
          fbb.addOffset(29, savedTimeOffset);
          fbb.addOffset(30, dbVulnerabilitiesOffset);
          fbb.addOffset(31, dbOccupationOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateOfBirthValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final object = FamilyMemberIndividualDataModel(
              userName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..dateOfBirth = dateOfBirthValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(dateOfBirthValue)
            ..gender = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 10)
            ..phoneNumber = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 12)
            ..educationQualification = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 14)
            ..aadhaarNumber = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 16)
            ..dailyWageWorker = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 18)
            ..incomePerDay = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 20)
            ..incomePerMonth = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 22)
            ..pension = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 24)
            ..businessStatus = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 26)
            ..maritalStatus = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 28)
            ..specialSkills =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 30)
            ..frequentAilments =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 32)
            ..commutableDisease =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 34)
            ..nonCommutableDisease =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 36)
            ..surgeries = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 38)
            ..anganwadiServicesAware = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 40)
            ..anganwadiServicesUsing = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 42)
            ..anganwadiServicesUsedList =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 44)
            ..PHCServicesUsedList =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 46)
            ..privateClinicServicesUsedList =
                const fb.ListReader<String>(fb.StringReader(), lazy: false)
                    .vTableGetNullable(buffer, rootOffset, 48)
            ..privateServiceReason = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 50)
            ..useOfTobacco = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 52)
            ..useOfAlcohol = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 54)
            ..aarogyaSetuInstalled = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 56)
            ..vizhithiruInstalled = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 58)
            ..savedTime = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 62)
            ..dbVulnerabilities = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 64)
            ..dbOccupation = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 66);

          return object;
        }),
    FamilyMembersCommonDataModel: EntityDefinition<
            FamilyMembersCommonDataModel>(
        model: _entities[2],
        toOneRelations: (FamilyMembersCommonDataModel object) => [],
        toManyRelations: (FamilyMembersCommonDataModel object) => {
              RelInfo<FamilyMembersCommonDataModel>.toMany(1, object.id):
                  object.individualDataList
            },
        getId: (FamilyMembersCommonDataModel object) => object.id,
        setId: (FamilyMembersCommonDataModel object, int id) {
          object.id = id;
        },
        objectToFB: (FamilyMembersCommonDataModel object, fb.Builder fbb) {
          final drinkingWaterOffset = object.drinkingWater == null
              ? null
              : fbb.writeString(object.drinkingWater!);
          final sourceOfDrinkingWaterOffset =
              object.sourceOfDrinkingWater == null
                  ? null
                  : fbb.writeString(object.sourceOfDrinkingWater!);
          final toiletFacilityOffset = object.toiletFacility == null
              ? null
              : fbb.writeString(object.toiletFacility!);
          final communityToiletOffset = object.communityToilet == null
              ? null
              : fbb.writeString(object.communityToilet!);
          final environmentSanitationLevelOffset =
              object.environmentSanitationLevel == null
                  ? null
                  : fbb.writeString(object.environmentSanitationLevel!);
          final runningWaterAvailableOffset =
              object.runningWaterAvailable == null
                  ? null
                  : fbb.writeString(object.runningWaterAvailable!);
          final noOfTwoWheelersOffset = object.noOfTwoWheelers == null
              ? null
              : fbb.writeString(object.noOfTwoWheelers!);
          final noOfThreeWheelersOffset = object.noOfThreeWheelers == null
              ? null
              : fbb.writeString(object.noOfThreeWheelers!);
          final noOfFourWheelersOffset = object.noOfFourWheelers == null
              ? null
              : fbb.writeString(object.noOfFourWheelers!);
          final isCattleOwnedOffset = object.isCattleOwned == null
              ? null
              : fbb.writeString(object.isCattleOwned!);
          final incomeFromCattleOffset = object.incomeFromCattle == null
              ? null
              : fbb.writeString(object.incomeFromCattle!);
          final isFarmLandOwnedOffset = object.isFarmLandOwned == null
              ? null
              : fbb.writeString(object.isFarmLandOwned!);
          final isSeedsPreservedOffset = object.isSeedsPreserved == null
              ? null
              : fbb.writeString(object.isSeedsPreserved!);
          final isKitchenGardenOwnedOffset = object.isKitchenGardenOwned == null
              ? null
              : fbb.writeString(object.isKitchenGardenOwned!);
          final addressOneOffset = object.addressOne == null
              ? null
              : fbb.writeString(object.addressOne!);
          final addressTwoOffset = object.addressTwo == null
              ? null
              : fbb.writeString(object.addressTwo!);
          final addressThreeOffset = object.addressThree == null
              ? null
              : fbb.writeString(object.addressThree!);
          final savedTimeOffset = object.savedTime == null
              ? null
              : fbb.writeString(object.savedTime!);
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
          fbb.startTable(24);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, drinkingWaterOffset);
          fbb.addOffset(2, sourceOfDrinkingWaterOffset);
          fbb.addOffset(3, toiletFacilityOffset);
          fbb.addOffset(4, communityToiletOffset);
          fbb.addOffset(5, environmentSanitationLevelOffset);
          fbb.addOffset(6, runningWaterAvailableOffset);
          fbb.addOffset(7, noOfTwoWheelersOffset);
          fbb.addOffset(8, noOfThreeWheelersOffset);
          fbb.addOffset(9, noOfFourWheelersOffset);
          fbb.addOffset(10, isCattleOwnedOffset);
          fbb.addOffset(11, incomeFromCattleOffset);
          fbb.addOffset(12, isFarmLandOwnedOffset);
          fbb.addOffset(13, isSeedsPreservedOffset);
          fbb.addOffset(14, isKitchenGardenOwnedOffset);
          fbb.addOffset(15, addressOneOffset);
          fbb.addOffset(16, addressTwoOffset);
          fbb.addOffset(17, addressThreeOffset);
          fbb.addOffset(18, savedTimeOffset);
          fbb.addOffset(19, dbLocationTopLeftOffset);
          fbb.addOffset(20, dbLocationTopRightOffset);
          fbb.addOffset(21, dbLocationBottomLeftOffset);
          fbb.addOffset(22, dbLocationBottomRightOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = FamilyMembersCommonDataModel()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..drinkingWater =
                const fb.StringReader().vTableGetNullable(buffer, rootOffset, 6)
            ..sourceOfDrinkingWater =
                const fb.StringReader().vTableGetNullable(buffer, rootOffset, 8)
            ..toiletFacility = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 10)
            ..communityToilet = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 12)
            ..environmentSanitationLevel = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 14)
            ..runningWaterAvailable = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 16)
            ..noOfTwoWheelers = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 18)
            ..noOfThreeWheelers = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 20)
            ..noOfFourWheelers = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 22)
            ..isCattleOwned = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 24)
            ..incomeFromCattle = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 26)
            ..isFarmLandOwned = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 28)
            ..isSeedsPreserved = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 30)
            ..isKitchenGardenOwned = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 32)
            ..addressOne = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 34)
            ..addressTwo = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 36)
            ..addressThree = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 38)
            ..savedTime = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 40)
            ..dbLocationTopLeft = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 42)
            ..dbLocationTopRight = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 44)
            ..dbLocationBottomLeft = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 46)
            ..dbLocationBottomRight = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 48);
          InternalToManyAccess.setRelInfo(
              object.individualDataList,
              store,
              RelInfo<FamilyMembersCommonDataModel>.toMany(1, object.id),
              store.box<FamilyMembersCommonDataModel>());
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

  /// see [CommunityDataModel.savedTime]
  static final savedTime =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[3]);

  /// see [CommunityDataModel.dbLocationTopLeft]
  static final dbLocationTopLeft =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[4]);

  /// see [CommunityDataModel.dbLocationTopRight]
  static final dbLocationTopRight =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[5]);

  /// see [CommunityDataModel.dbLocationBottomLeft]
  static final dbLocationBottomLeft =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[6]);

  /// see [CommunityDataModel.dbLocationBottomRight]
  static final dbLocationBottomRight =
      QueryStringProperty<CommunityDataModel>(_entities[0].properties[7]);
}

/// [FamilyMemberIndividualDataModel] entity fields to define ObjectBox queries.
class FamilyMemberIndividualDataModel_ {
  /// see [FamilyMemberIndividualDataModel.id]
  static final id = QueryIntegerProperty<FamilyMemberIndividualDataModel>(
      _entities[1].properties[0]);

  /// see [FamilyMemberIndividualDataModel.userName]
  static final userName = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[1].properties[1]);

  /// see [FamilyMemberIndividualDataModel.dateOfBirth]
  static final dateOfBirth =
      QueryIntegerProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[2]);

  /// see [FamilyMemberIndividualDataModel.gender]
  static final gender = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[1].properties[3]);

  /// see [FamilyMemberIndividualDataModel.phoneNumber]
  static final phoneNumber =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[4]);

  /// see [FamilyMemberIndividualDataModel.educationQualification]
  static final educationQualification =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[5]);

  /// see [FamilyMemberIndividualDataModel.aadhaarNumber]
  static final aadhaarNumber =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[6]);

  /// see [FamilyMemberIndividualDataModel.dailyWageWorker]
  static final dailyWageWorker =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[7]);

  /// see [FamilyMemberIndividualDataModel.incomePerDay]
  static final incomePerDay =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[8]);

  /// see [FamilyMemberIndividualDataModel.incomePerMonth]
  static final incomePerMonth =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[9]);

  /// see [FamilyMemberIndividualDataModel.pension]
  static final pension = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[1].properties[10]);

  /// see [FamilyMemberIndividualDataModel.businessStatus]
  static final businessStatus =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[11]);

  /// see [FamilyMemberIndividualDataModel.maritalStatus]
  static final maritalStatus =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[12]);

  /// see [FamilyMemberIndividualDataModel.specialSkills]
  static final specialSkills =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[13]);

  /// see [FamilyMemberIndividualDataModel.frequentAilments]
  static final frequentAilments =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[14]);

  /// see [FamilyMemberIndividualDataModel.commutableDisease]
  static final commutableDisease =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[15]);

  /// see [FamilyMemberIndividualDataModel.nonCommutableDisease]
  static final nonCommutableDisease =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[16]);

  /// see [FamilyMemberIndividualDataModel.surgeries]
  static final surgeries = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[1].properties[17]);

  /// see [FamilyMemberIndividualDataModel.anganwadiServicesAware]
  static final anganwadiServicesAware =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[18]);

  /// see [FamilyMemberIndividualDataModel.anganwadiServicesUsing]
  static final anganwadiServicesUsing =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[19]);

  /// see [FamilyMemberIndividualDataModel.anganwadiServicesUsedList]
  static final anganwadiServicesUsedList =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[20]);

  /// see [FamilyMemberIndividualDataModel.PHCServicesUsedList]
  static final PHCServicesUsedList =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[21]);

  /// see [FamilyMemberIndividualDataModel.privateClinicServicesUsedList]
  static final privateClinicServicesUsedList =
      QueryStringVectorProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[22]);

  /// see [FamilyMemberIndividualDataModel.privateServiceReason]
  static final privateServiceReason =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[23]);

  /// see [FamilyMemberIndividualDataModel.useOfTobacco]
  static final useOfTobacco =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[24]);

  /// see [FamilyMemberIndividualDataModel.useOfAlcohol]
  static final useOfAlcohol =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[25]);

  /// see [FamilyMemberIndividualDataModel.aarogyaSetuInstalled]
  static final aarogyaSetuInstalled =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[26]);

  /// see [FamilyMemberIndividualDataModel.vizhithiruInstalled]
  static final vizhithiruInstalled =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[27]);

  /// see [FamilyMemberIndividualDataModel.savedTime]
  static final savedTime = QueryStringProperty<FamilyMemberIndividualDataModel>(
      _entities[1].properties[28]);

  /// see [FamilyMemberIndividualDataModel.dbVulnerabilities]
  static final dbVulnerabilities =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[29]);

  /// see [FamilyMemberIndividualDataModel.dbOccupation]
  static final dbOccupation =
      QueryStringProperty<FamilyMemberIndividualDataModel>(
          _entities[1].properties[30]);
}

/// [FamilyMembersCommonDataModel] entity fields to define ObjectBox queries.
class FamilyMembersCommonDataModel_ {
  /// see [FamilyMembersCommonDataModel.id]
  static final id = QueryIntegerProperty<FamilyMembersCommonDataModel>(
      _entities[2].properties[0]);

  /// see [FamilyMembersCommonDataModel.drinkingWater]
  static final drinkingWater =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[1]);

  /// see [FamilyMembersCommonDataModel.sourceOfDrinkingWater]
  static final sourceOfDrinkingWater =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[2]);

  /// see [FamilyMembersCommonDataModel.toiletFacility]
  static final toiletFacility =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[3]);

  /// see [FamilyMembersCommonDataModel.communityToilet]
  static final communityToilet =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[4]);

  /// see [FamilyMembersCommonDataModel.environmentSanitationLevel]
  static final environmentSanitationLevel =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[5]);

  /// see [FamilyMembersCommonDataModel.runningWaterAvailable]
  static final runningWaterAvailable =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[6]);

  /// see [FamilyMembersCommonDataModel.noOfTwoWheelers]
  static final noOfTwoWheelers =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[7]);

  /// see [FamilyMembersCommonDataModel.noOfThreeWheelers]
  static final noOfThreeWheelers =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[8]);

  /// see [FamilyMembersCommonDataModel.noOfFourWheelers]
  static final noOfFourWheelers =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[9]);

  /// see [FamilyMembersCommonDataModel.isCattleOwned]
  static final isCattleOwned =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[10]);

  /// see [FamilyMembersCommonDataModel.incomeFromCattle]
  static final incomeFromCattle =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[11]);

  /// see [FamilyMembersCommonDataModel.isFarmLandOwned]
  static final isFarmLandOwned =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[12]);

  /// see [FamilyMembersCommonDataModel.isSeedsPreserved]
  static final isSeedsPreserved =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[13]);

  /// see [FamilyMembersCommonDataModel.isKitchenGardenOwned]
  static final isKitchenGardenOwned =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[14]);

  /// see [FamilyMembersCommonDataModel.addressOne]
  static final addressOne = QueryStringProperty<FamilyMembersCommonDataModel>(
      _entities[2].properties[15]);

  /// see [FamilyMembersCommonDataModel.addressTwo]
  static final addressTwo = QueryStringProperty<FamilyMembersCommonDataModel>(
      _entities[2].properties[16]);

  /// see [FamilyMembersCommonDataModel.addressThree]
  static final addressThree = QueryStringProperty<FamilyMembersCommonDataModel>(
      _entities[2].properties[17]);

  /// see [FamilyMembersCommonDataModel.savedTime]
  static final savedTime = QueryStringProperty<FamilyMembersCommonDataModel>(
      _entities[2].properties[18]);

  /// see [FamilyMembersCommonDataModel.dbLocationTopLeft]
  static final dbLocationTopLeft =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[19]);

  /// see [FamilyMembersCommonDataModel.dbLocationTopRight]
  static final dbLocationTopRight =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[20]);

  /// see [FamilyMembersCommonDataModel.dbLocationBottomLeft]
  static final dbLocationBottomLeft =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[21]);

  /// see [FamilyMembersCommonDataModel.dbLocationBottomRight]
  static final dbLocationBottomRight =
      QueryStringProperty<FamilyMembersCommonDataModel>(
          _entities[2].properties[22]);

  /// see [FamilyMembersCommonDataModel.individualDataList]
  static final individualDataList = QueryRelationToMany<
      FamilyMembersCommonDataModel,
      FamilyMemberIndividualDataModel>(_entities[2].relations[0]);
}
