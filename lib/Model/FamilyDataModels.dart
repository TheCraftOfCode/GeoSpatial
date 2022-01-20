import 'dart:convert';
import 'package:geo_spatial/Widgets/NestedOptionsWidget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

//TODO: Add condition to set empty, <NA> value to dependent fields

List<String> buildListForOptionWidget(Map<String, bool> mapData) {
  var listData = <String>[];

  mapData.forEach((key, value) {
    if (value) {
      listData.add(key);
    }
  });
  return listData;
}

@Entity()
class FamilyMemberIndividualDataModel {
  parseOccupationJson(List<NestedOptionData> occupationData) {
    var list = [];
    for (var i in occupationData) {
      list.add(i.toJsonString());
    }

    return json.encode(list);
  }

  parseOccupationServerResultJSON(List<NestedOptionData> occupationData) {
    var list = [];
    for (var i in occupationData) {
      if (i.isSelected == true) {
        var job = [];
        i.subOptionDataMap!.forEach((key, value) {
          if (value == true) {
            job.add(key);
          }
        });
        list.add({"category: ": i.boxName, "job: ": job});
      }
    }
    print("ENC: ${json.encode(list)}");
    return list;
  }

  parseOccupationObject(String occupationData) {
    List<dynamic> occupationStringList = json.decode(occupationData);
    List<NestedOptionData> list = [];

    for (var i in occupationStringList) {
      list.add(NestedOptionData.fromJson(i));
    }

    return list;
  }

  int id = 0;
  String? userName;
  @Property(type: PropertyType.date)
  DateTime? dateOfBirth;
  String? gender;
  String? phoneNumber;
  String? educationQualification;
  String? aadhaarNumber;
  Map<String, bool>? vulnerabilities;
  String? dailyWageWorker;
  List<NestedOptionData>? occupationData;
  String? employed;
  String? income;
  String? incomeType;
  String? pension;
  String? businessStatus;
  String? maritalStatus;
  String? noOfDaysWorking;
  List<String>? specialSkills;
  List<String>? workTimings;
  String? surgeries;
  String? anganwadiServicesAware;
  String? anganwadiServicesUsing;
  List<String>? anganwadiServicesUsedList;
  String? PHCServicesUsed;
  String? privateClinicServicesUsed;
  Map<String, bool>? privateServiceReason;
  Map<String, bool>? communicableDiseases;
  Map<String, bool>? frequentAilments;
  Map<String, bool>? nonCommunicableDiseases;
  String? useOfTobacco;
  Map<String, bool>? tobaccoProducts;
  String? useOfAlcohol;
  String? aarogyaSetuInstalled;
  String? vizhithiruInstalled;
  bool? dataValid = false;

  //String? savedTime = DateFormat('hh:mm a').format(DateTime.now());

  Map<String, dynamic> toJson() {
    return {
      "UIN": "",
      "name": userName ?? "<NA>",
      "dateOfBirth":
          "${dateOfBirth!.day}-${dateOfBirth!.month}-${dateOfBirth!.year}",
      "gender": gender ?? "<NA>",
      "phoneNumber": phoneNumber ?? "<NA>",
      "educationalQualification": educationQualification ?? "<NA>",
      "aadhaarNumber": aadhaarNumber ?? "<NA>",
      "Vulnerabilities": vulnerabilities != null
          ? buildListForOptionWidget(vulnerabilities!)
          : ['None'],
      "isADailyWageWorker": dailyWageWorker ?? "<NA>",
      "occupationData": occupationData == null
          ? ["<NA>"]
          : parseOccupationServerResultJSON(occupationData!),
      "employed": employed ?? "<NA>",
      "income": income ?? "<NA>",
      "incomeType": incomeType ?? "<NA>",
      "oldAgePension": pension ?? "<NA>",
      "businessStatus": businessStatus ?? "<NA>",
      "maritalStatus": maritalStatus ?? "<NA>",
      "noOfDaysWorking": noOfDaysWorking ?? "<NA>",
      "specialSkills": specialSkills ?? "<NA>",
      "workTimings": workTimings ?? "<NA>",
      "surgeriesUndergone": surgeries ?? "<NA>",
      "anganwadiServicesAware": anganwadiServicesAware ?? "<NA>",
      "anganwadiServicesUsed": anganwadiServicesUsing ?? "<NA>",
      "anganwadiServicesUtilised": anganwadiServicesUsedList ?? "<NA>",
      "phcServicesUtilised": PHCServicesUsed ?? "<NA>",
      "privateHealthClinicFacilitiesUsed": privateClinicServicesUsed ?? "<NA>",
      "reasonsForVisitingPrivateHealthClinic": privateServiceReason != null
          ? buildListForOptionWidget(privateServiceReason!)
          : [],
      "communicableDiseases": communicableDiseases != null
          ? buildListForOptionWidget(communicableDiseases!)
          : [],
      "frequentHealthAilments": frequentAilments != null
          ? buildListForOptionWidget(frequentAilments!)
          : [],
      "nonCommunicableDiseases": nonCommunicableDiseases != null
          ? buildListForOptionWidget(nonCommunicableDiseases!)
          : [],
      "tobaccoBasedProductsUsage": useOfTobacco ?? "<NA>",
      "tobaccoProductsUsed": tobaccoProducts != null
          ? buildListForOptionWidget(tobaccoProducts!)
          : [],
      "alcoholConsumption": useOfAlcohol ?? "<NA>",
      "arogyaSethuAppInstallationStatus": aarogyaSetuInstalled ?? "<NA>",
      "vizhithiruAppInstallationStatus": vizhithiruInstalled ?? "<NA>"
    };
  }

  FamilyMemberIndividualDataModel({this.userName});

  String? get dbVulnerabilities =>
      vulnerabilities == null ? null : json.encode(vulnerabilities);

  set dbVulnerabilities(String? value) {
    if (value == null) {
      vulnerabilities = null;
    } else {
      vulnerabilities = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbOccupationData =>
      occupationData == null ? null : parseOccupationJson(occupationData!);

  set dbOccupationData(String? value) {
    if (value == null) {
      occupationData = null;
    } else {
      var data = parseOccupationObject(value);
      if (data.isEmpty) {
        occupationData = null;
      } else {
        occupationData = data;
      }
    }
  }

  String? get dbPrivateServiceReason =>
      privateServiceReason == null ? null : json.encode(privateServiceReason);

  set dbPrivateServiceReason(String? value) {
    if (value == null) {
      privateServiceReason = null;
    } else {
      privateServiceReason = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbCommunicableDiseases =>
      communicableDiseases == null ? null : json.encode(communicableDiseases);

  set dbCommunicableDiseases(String? value) {
    if (value == null) {
      communicableDiseases = null;
    } else {
      communicableDiseases = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbFrequentAilments =>
      frequentAilments == null ? null : json.encode(frequentAilments);

  set dbFrequentAilments(String? value) {
    if (value == null) {
      frequentAilments = null;
    } else {
      frequentAilments = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbNonCommunicableDiseases => nonCommunicableDiseases == null
      ? null
      : json.encode(nonCommunicableDiseases);

  set dbNonCommunicableDiseases(String? value) {
    if (value == null) {
      nonCommunicableDiseases = null;
    } else {
      nonCommunicableDiseases = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbTobaccoProducts =>
      tobaccoProducts == null ? null : json.encode(tobaccoProducts);

  set dbTobaccoProducts(String? value) {
    if (value == null) {
      tobaccoProducts = null;
    } else {
      tobaccoProducts = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }
}

@Entity()
class FamilyMembersCommonDataModel {
  int id = 0;
  String? recordCollectingUserId;

  Position? locationTopLeft;
  Position? locationTopRight;
  Position? locationBottomLeft;
  Position? locationBottomRight;

  String? headOfFamily;
  String? drinkingWater;
  Map<String, bool>? sourceOfDrinkingWater;
  String? toiletFacility;
  Map<String, bool>? noToiletsWhy;
  String? communityToilet;
  String? environmentSanitationLevel;
  String? runningWaterAvailable;
  String? noOfTwoWheelers;
  String? noOfThreeWheelers;
  String? noOfFourWheelers;
  Map<String, bool>? twoThreeWheelManufacturer;
  Map<String, bool>? fourWheelManufacturer;
  Map<String, bool>? localFoodMap;
  String? isCattleOwned;
  String? incomeFromCattle;
  String? isFarmLandOwned;
  String? isSeedsPreserved;
  Map<String, bool>? cropsCultivated;
  Map<String, bool>? preservedSeedsMap;
  Map<String, bool>? treesOwnedMap;
  String? isKitchenGardenOwned;
  Map<String, bool>? kitchenGardenPlants;
  String? addressOne;
  String? addressTwo;
  String? city;
  String? villageCode;
  bool? locationPageValid = false;
  bool? commonDetailsValid = false;

  @Transient()
  final individualDataListTransient = <FamilyMemberIndividualDataModel>[];
  final individualDataList = ToMany<FamilyMemberIndividualDataModel>();

  Map<String, dynamic> toJson() {
    return {
      'familyMemberData':
          individualDataListTransient.map((item) => item.toJson()).toList(),
      'locationTopLeft': [
        locationTopLeft!.latitude,
        locationTopLeft!.longitude
      ],
      'locationTopRight': [
        locationTopRight!.latitude,
        locationTopRight!.longitude
      ],
      'locationBottomLeft': [
        locationBottomLeft!.latitude,
        locationBottomLeft!.longitude
      ],
      'locationBottomRight': [
        locationBottomRight!.latitude,
        locationBottomRight!.longitude
      ],
      "headOfFamily": headOfFamily,
      "availabilityOfDrinkingWater": drinkingWater ?? "<NA>",
      "drinkingWaterSource": sourceOfDrinkingWater != null
          ? buildListForOptionWidget(sourceOfDrinkingWater!)
          : [],
      "areToiletsAvailableInHouse": toiletFacility ?? "<NA>",
      "noToiletsWhy":
          noToiletsWhy != null ? buildListForOptionWidget(noToiletsWhy!) : [],
      "alternativeForHouseholdToilet": communityToilet ?? "<NA>",
      "statusOfEnvironmentalSanitation": environmentSanitationLevel ?? "<NA>",
      "availabilityOfWaterInToilets": runningWaterAvailable ?? "<NA>",
      "numberOfTwoWheelers": noOfTwoWheelers ?? "<NA>",
      "numberOfThreeWheelers": noOfThreeWheelers ?? "<NA>",
      "numberOfFourWheelers": noOfFourWheelers ?? "<NA>",
      "brandsOfTwoThreeWheelers": twoThreeWheelManufacturer != null
          ? buildListForOptionWidget(twoThreeWheelManufacturer!)
          : [],
      "brandsOfFourWheelers": fourWheelManufacturer != null
          ? buildListForOptionWidget(fourWheelManufacturer!)
          : [],
      "locallyAvailableFoodsConsumed":
          localFoodMap != null ? buildListForOptionWidget(localFoodMap!) : [],
      "doYouOwnCattle": isCattleOwned,
      "incomeFromCattle": isCattleOwned == 'yes' ? incomeFromCattle : '<NA>',
      "doYouOwnFarmLand": isFarmLandOwned ?? "<NA>",
      "doYouPreserveSeeds": isSeedsPreserved ?? "<NA>",
      "cropsCultivated": cropsCultivated != null
          ? buildListForOptionWidget(cropsCultivated!)
          : [],
      "typesOfSeedsPreserved": preservedSeedsMap != null
          ? buildListForOptionWidget(preservedSeedsMap!)
          : [],
      "treesOwnedIfAny":
          treesOwnedMap != null ? buildListForOptionWidget(treesOwnedMap!) : [],
      "isKitchenGardenAvailable": isKitchenGardenOwned ?? "<NA>",
      "cropsInKitchenGarden": kitchenGardenPlants != null
          ? buildListForOptionWidget(kitchenGardenPlants!)
          : [],
      "address": "$addressOne\n$addressTwo\n$city",
      "villageCode": villageCode ?? "<NA>"
    };
  }

  String? savedTime = DateFormat('kk:mm:ss, EEE d MMM').format(DateTime.now());

  String? get dbLocationTopLeft {
    if (locationTopLeft == null) {
      return null;
    } else {
      Map<String, dynamic> data = locationTopLeft!.toJson();
      var encodedData = json.encode(data);
      return encodedData;
    }
  }

  set dbLocationTopLeft(String? value) {
    if (value == null) {
      locationTopLeft = null;
    } else {
      final body = json.decode(value.trim());
      locationTopLeft = new Position(
          longitude: body['longitude'] ?? 0,
          latitude: body['latitude'] ?? 0,
          timestamp: DateTime.fromMicrosecondsSinceEpoch(body['timestamp']),
          accuracy: body['accuracy'] ?? 0,
          altitude: body['altitude'] ?? 0,
          heading: body['heading'] ?? 0,
          speed: body['speed'] ?? 0,
          speedAccuracy: body['speedAccuracy'] ?? 0);
    }
  }

  String? get dbLocationTopRight {
    if (locationTopRight == null) {
      return null;
    } else {
      Map<String, dynamic> data = locationTopRight!.toJson();
      var encodedData = json.encode(data);
      return encodedData;
    }
  }

  set dbLocationTopRight(String? value) {
    if (value == null) {
      locationTopRight = null;
    } else {
      final body = json.decode(value.trim());
      locationTopRight = new Position(
          longitude: body['longitude'] ?? 0,
          latitude: body['latitude'] ?? 0,
          timestamp: DateTime.fromMicrosecondsSinceEpoch(body['timestamp']),
          accuracy: body['accuracy'] ?? 0,
          altitude: body['altitude'] ?? 0,
          heading: body['heading'] ?? 0,
          speed: body['speed'] ?? 0,
          speedAccuracy: body['speedAccuracy'] ?? 0);
    }
  }

  String? get dbLocationBottomLeft {
    if (locationBottomLeft == null) {
      return null;
    } else {
      Map<String, dynamic> data = locationBottomLeft!.toJson();
      var encodedData = json.encode(data);
      return encodedData;
    }
  }

  set dbLocationBottomLeft(String? value) {
    if (value == null) {
      locationBottomLeft = null;
    } else {
      final body = json.decode(value.trim());
      locationBottomLeft = new Position(
          longitude: body['longitude'] ?? 0,
          latitude: body['latitude'] ?? 0,
          timestamp: DateTime.fromMicrosecondsSinceEpoch(body['timestamp']),
          accuracy: body['accuracy'] ?? 0,
          altitude: body['altitude'] ?? 0,
          heading: body['heading'] ?? 0,
          speed: body['speed'] ?? 0,
          speedAccuracy: body['speedAccuracy'] ?? 0);
    }
  }

  String? get dbLocationBottomRight {
    if (locationBottomRight == null) {
      return null;
    } else {
      Map<String, dynamic> data = locationBottomRight!.toJson();
      var encodedData = json.encode(data);
      return encodedData;
    }
  }

  set dbLocationBottomRight(String? value) {
    if (value == null) {
      locationBottomRight = null;
    } else {
      final body = json.decode(value.trim());

      locationBottomRight = new Position(
          longitude: body['longitude'] ?? 0,
          latitude: body['latitude'] ?? 0,
          timestamp: DateTime.fromMicrosecondsSinceEpoch(body['timestamp']),
          accuracy: body['accuracy'] ?? 0,
          altitude: body['altitude'] ?? 0,
          heading: body['heading'] ?? 0,
          speed: body['speed'] ?? 0,
          speedAccuracy: body['speedAccuracy'] ?? 0);
    }
  }

  String? get dbTwoThreeWheelManufacturer => twoThreeWheelManufacturer == null
      ? null
      : json.encode(twoThreeWheelManufacturer);

  set dbTwoThreeWheelManufacturer(String? value) {
    if (value == null) {
      twoThreeWheelManufacturer = null;
    } else {
      twoThreeWheelManufacturer = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbSourceOfDrinkingWater =>
      sourceOfDrinkingWater == null ? null : json.encode(sourceOfDrinkingWater);

  set dbSourceOfDrinkingWater(String? value) {
    if (value == null) {
      sourceOfDrinkingWater = null;
    } else {
      sourceOfDrinkingWater = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbTwoFourManufacturer =>
      fourWheelManufacturer == null ? null : json.encode(fourWheelManufacturer);

  set dbTwoFourManufacturer(String? value) {
    if (value == null) {
      fourWheelManufacturer = null;
    } else {
      fourWheelManufacturer = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbLocalFoodMap =>
      localFoodMap == null ? null : json.encode(localFoodMap);

  set dbLocalFoodMap(String? value) {
    if (value == null) {
      localFoodMap = null;
    } else {
      localFoodMap = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbPreservedSeedsMap =>
      preservedSeedsMap == null ? null : json.encode(preservedSeedsMap);

  set dbPreservedSeedsMap(String? value) {
    if (value == null) {
      preservedSeedsMap = null;
    } else {
      preservedSeedsMap = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbNoToiletsWhy =>
      noToiletsWhy == null ? null : json.encode(noToiletsWhy);

  set dbNoToiletsWhy(String? value) {
    if (value == null) {
      noToiletsWhy = null;
    } else {
      noToiletsWhy = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbCropsCultivated =>
      cropsCultivated == null ? null : json.encode(cropsCultivated);

  set dbCropsCultivated(String? value) {
    if (value == null) {
      cropsCultivated = null;
    } else {
      cropsCultivated = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbTreesOwnedMap =>
      treesOwnedMap == null ? null : json.encode(treesOwnedMap);

  set dbTreesOwnedMap(String? value) {
    if (value == null) {
      treesOwnedMap = null;
    } else {
      treesOwnedMap = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }

  String? get dbKitchenGardenPlants =>
      kitchenGardenPlants == null ? null : json.encode(kitchenGardenPlants);

  set dbKitchenGardenPlants(String? value) {
    if (value == null) {
      kitchenGardenPlants = null;
    } else {
      kitchenGardenPlants = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }
}
