import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class FamilyMemberIndividualDataModel {
  int id = 0;
  String? userName;
  @Property(type: PropertyType.date)
  DateTime? dateOfBirth;
  String? gender;
  String? phoneNumber;
  String? educationQualification;
  String? aadhaarNumber;
  Map<String, bool>? vulnerabilities;
  Map<String, bool>? occupation;
  String? dailyWageWorker;
  String? incomePerDay;
  String? incomePerMonth;
  String? pension;
  String? businessStatus;
  String? maritalStatus;
  List<String>? specialSkills;
  List<String>? frequentAilments;
  List<String>? commutableDisease;
  List<String>? nonCommutableDisease;
  String? surgeries;
  String? anganwadiServicesAware;
  String? anganwadiServicesUsing;
  List<String>? anganwadiServicesUsedList;
  List<String>? PHCServicesUsedList;
  List<String>? privateClinicServicesUsedList;
  String? privateServiceReason;
  String? useOfTobacco;
  String? useOfAlcohol;
  String? aarogyaSetuInstalled;
  String? vizhithiruInstalled;

  String? savedTime = DateFormat('kk:mm:ss, EEE d MMM').format(DateTime.now());

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

  String? get dbOccupation =>
      occupation == null ? null : json.encode(occupation);

  set dbOccupation(String? value) {
    if (value == null) {
      occupation = null;
    } else {
      occupation = Map.from(
          json.decode(value).map((k, v) => MapEntry(k as String, v as bool)));
    }
  }
}

@Entity()
class FamilyMembersCommonDataModel {
  int id = 0;
  Position? locationTopLeft;
  Position? locationTopRight;
  Position? locationBottomLeft;
  Position? locationBottomRight;
  String? drinkingWater;
  String? sourceOfDrinkingWater;
  String? toiletFacility;
  String? communityToilet;
  String? environmentSanitationLevel;
  String? runningWaterAvailable;
  String? noOfTwoWheelers;
  String? noOfThreeWheelers;
  String? noOfFourWheelers;
  Map<String, bool>? twoThreeWheelManufacturer;
  Map<String, bool>? twoFourManufacturer;
  Map<String, bool>? localFoodMap;
  String? isCattleOwned;
  String? incomeFromCattle;
  String? isFarmLandOwned;
  String? isSeedsPreserved;
  Map<String, bool>? preservedSeedsMap;
  Map<String, bool>? treesOwnedMap;
  String? isKitchenGardenOwned;
  Map<String, bool>? kitchenGardenPlants;
  String? addressOne;
  String? addressTwo;
  String? city;

  @Transient()
  final individualDataListTransient = <FamilyMemberIndividualDataModel>[];
  final individualDataList = ToMany<FamilyMemberIndividualDataModel>();

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

  String? get dbTwoFourManufacturer =>
      twoFourManufacturer == null ? null : json.encode(twoFourManufacturer);

  set dbTwoFourManufacturer(String? value) {
    if (value == null) {
      twoFourManufacturer = null;
    } else {
      twoFourManufacturer = Map.from(
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

  FamilyMembersCommonDataModel({
    //this.keys,
    this.locationBottomLeft,
    this.locationBottomRight,
    this.locationTopLeft,
    this.locationTopRight,
  });
}
