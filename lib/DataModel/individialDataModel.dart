import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.id,
    required this.personalInfoCollection,
    required this.geoJson,
    required this.familyCommonData,
    required this.v,
  });

  Id id;
  List<PersonalInfoCollection> personalInfoCollection;
  GeoJson geoJson;
  FamilyCommonData familyCommonData;
  String v;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: Id.fromJson(json["_id"]),
        personalInfoCollection: List<PersonalInfoCollection>.from(
            json["PersonalInfoCollection"]
                .map((x) => PersonalInfoCollection.fromJson(x))),
        geoJson: GeoJson.fromJson(json["GeoJson"]),
        familyCommonData: FamilyCommonData.fromJson(json["FamilyCommonData"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "PersonalInfoCollection":
            List<dynamic>.from(personalInfoCollection.map((x) => x.toJson())),
        "GeoJson": geoJson.toJson(),
        "FamilyCommonData": familyCommonData.toJson(),
        "__v": v,
      };
}

class FamilyCommonData {
  FamilyCommonData({
    required this.availabilityOfDrinkingWater,
    required this.drinkingWaterSource,
    required this.areToiletsAvailableInHouse,
    required this.availabilityOfWaterInToilets,
    required this.alternativeForHouseholdToilet,
    required this.statusOfEnvironmentalSanitation,
    required this.numberOfTwoWheelers,
    required this.brandsOfTwoWheelers,
    required this.numberOfThreeWheelers,
    required this.brandsOfThreeWheelers,
    required this.numberOfFourWheelers,
    required this.brandsOfFourWheelers,
    required this.doYouOwnCattle,
    required this.incomeFromCattle,
    required this.doYouOwnFarmLand,
    required this.cropsCultivated,
    required this.doYouPreserveSeeds,
    required this.typesOfSeedsPreserved,
    required this.locallyAvailableFoodsConsumed,
    required this.treesOwnedIfAny,
    required this.isKitchenGardenAvailable,
    required this.cropsInKitchenGarden,
    required this.address,
    required this.villagename,
  });

  String availabilityOfDrinkingWater;
  String drinkingWaterSource;
  String areToiletsAvailableInHouse;
  String availabilityOfWaterInToilets;
  String alternativeForHouseholdToilet;
  String statusOfEnvironmentalSanitation;
  String numberOfTwoWheelers;
  String brandsOfTwoWheelers;
  String numberOfThreeWheelers;
  String brandsOfThreeWheelers;
  String numberOfFourWheelers;
  String brandsOfFourWheelers;
  String doYouOwnCattle;
  String incomeFromCattle;
  String doYouOwnFarmLand;
  String cropsCultivated;
  String doYouPreserveSeeds;
  String typesOfSeedsPreserved;
  String locallyAvailableFoodsConsumed;
  String treesOwnedIfAny;
  String isKitchenGardenAvailable;
  String cropsInKitchenGarden;
  String address;
  String villagename;

  factory FamilyCommonData.fromJson(Map<String, dynamic> json) =>
      FamilyCommonData(
        availabilityOfDrinkingWater: json["availabilityOfDrinkingWater"],
        drinkingWaterSource: json["drinkingWaterSource"],
        areToiletsAvailableInHouse: json["areToiletsAvailableInHouse"],
        availabilityOfWaterInToilets: json["availabilityOfWaterInToilets"],
        alternativeForHouseholdToilet: json["alternativeForHouseholdToilet"],
        statusOfEnvironmentalSanitation:
            json["statusOfEnvironmentalSanitation"],
        numberOfTwoWheelers: json["numberOfTwoWheelers"],
        brandsOfTwoWheelers: json["brandsOfTwoWheelers"],
        numberOfThreeWheelers: json["numberOfThreeWheelers"],
        brandsOfThreeWheelers: json["brandsOfThreeWheelers"],
        numberOfFourWheelers: json["numberOfFourWheelers"],
        brandsOfFourWheelers: json["brandsOfFourWheelers"],
        doYouOwnCattle: json["doYouOwnCattle"],
        incomeFromCattle: json["incomeFromCattle"],
        doYouOwnFarmLand: json["doYouOwnFarmLand"],
        cropsCultivated: json["cropsCultivated"],
        doYouPreserveSeeds: json["doYouPreserveSeeds"],
        typesOfSeedsPreserved: json["typesOfSeedsPreserved"],
        locallyAvailableFoodsConsumed: json["locallyAvailableFoodsConsumed"],
        treesOwnedIfAny: json["treesOwnedIfAny"],
        isKitchenGardenAvailable: json["isKitchenGardenAvailable"],
        cropsInKitchenGarden: json["cropsInKitchenGarden"],
        address: json["address"],
        villagename: json["villagename"],
      );

  Map<String, dynamic> toJson() => {
        "availabilityOfDrinkingWater": availabilityOfDrinkingWater,
        "drinkingWaterSource": drinkingWaterSource,
        "areToiletsAvailableInHouse": areToiletsAvailableInHouse,
        "availabilityOfWaterInToilets": availabilityOfWaterInToilets,
        "alternativeForHouseholdToilet": alternativeForHouseholdToilet,
        "statusOfEnvironmentalSanitation": statusOfEnvironmentalSanitation,
        "numberOfTwoWheelers": numberOfTwoWheelers,
        "brandsOfTwoWheelers": brandsOfTwoWheelers,
        "numberOfThreeWheelers": numberOfThreeWheelers,
        "brandsOfThreeWheelers": brandsOfThreeWheelers,
        "numberOfFourWheelers": numberOfFourWheelers,
        "brandsOfFourWheelers": brandsOfFourWheelers,
        "doYouOwnCattle": doYouOwnCattle,
        "incomeFromCattle": incomeFromCattle,
        "doYouOwnFarmLand": doYouOwnFarmLand,
        "cropsCultivated": cropsCultivated,
        "doYouPreserveSeeds": doYouPreserveSeeds,
        "typesOfSeedsPreserved": typesOfSeedsPreserved,
        "locallyAvailableFoodsConsumed": locallyAvailableFoodsConsumed,
        "treesOwnedIfAny": treesOwnedIfAny,
        "isKitchenGardenAvailable": isKitchenGardenAvailable,
        "cropsInKitchenGarden": cropsInKitchenGarden,
        "address": address,
        "villagename": villagename,
      };
}

class GeoJson {
  GeoJson({
    required this.type,
    required this.properties,
    required this.geometry,
  });

  String type;
  Properties properties;
  Geometry geometry;

  factory GeoJson.fromJson(Map<String, dynamic> json) => GeoJson(
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
      };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<List<List<Coordinate>>> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<List<List<Coordinate>>>.from(json["coordinates"].map(
            (x) => List<List<Coordinate>>.from(x.map((x) =>
                List<Coordinate>.from(x.map((x) => Coordinate.fromJson(x))))))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) =>
            List<dynamic>.from(
                x.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))))),
      };
}

class Coordinate {
  Coordinate({
    required this.numberDouble,
  });

  String numberDouble;

  factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        numberDouble: json["\u0024numberDouble"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024numberDouble": numberDouble,
      };
}

class Properties {
  Properties({
    required this.name,
  });

  String name;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Id {
  Id({
    required this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class PersonalInfoCollection {
  PersonalInfoCollection({
    required this.name,
    required this.date,
    required this.gender,
    required this.maritalStatus,
    required this.educationQualification,
    required this.phoneNumber,
    required this.aadharNumber,
    required this.occupation,
    required this.workTimings,
    required this.isADailyWageWorker,
    required this.incomePerDay,
    required this.incomePerMonth,
    required this.specialSkills,
    required this.frequentHealthAilments,
    required this.communicableDiseases,
    required this.nonCommunicableDiseases,
    required this.surgeriesUndergone,
    required this.anganwadiServicesRendered,
    required this.anganwadiServicesUtilised,
    required this.phcServicesUtilised,
    required this.privateHealthClinicFacilitiesUsed,
    required this.reasonsForVisitingPrivateHealthClinic,
    required this.tobaccoBasedProductsUsage,
    required this.vulnerabilities,
    required this.alcoholConsumption,
    required this.oldAgePension,
    required this.businessStatus,
    required this.arogyaSethuAppInstallationStatus,
    required this.vizhithiruAppInstallationStatus,
  });

  String name;
  String date;
  String gender;
  String maritalStatus;
  List<Vulnerability> educationQualification;
  String phoneNumber;
  String aadharNumber;
  List<Vulnerability> occupation;
  String workTimings;
  String isADailyWageWorker;
  String incomePerDay;
  String incomePerMonth;
  String specialSkills;
  String frequentHealthAilments;
  String communicableDiseases;
  String nonCommunicableDiseases;
  String surgeriesUndergone;
  String anganwadiServicesRendered;
  String anganwadiServicesUtilised;
  String phcServicesUtilised;
  String privateHealthClinicFacilitiesUsed;
  String reasonsForVisitingPrivateHealthClinic;
  List<Vulnerability> tobaccoBasedProductsUsage;
  List<Vulnerability> vulnerabilities;
  String alcoholConsumption;
  String oldAgePension;
  String businessStatus;
  String arogyaSethuAppInstallationStatus;
  String vizhithiruAppInstallationStatus;

  factory PersonalInfoCollection.fromJson(Map<String, dynamic> json) =>
      PersonalInfoCollection(
        name: json["name"],
        date: json["date"],
        gender: json["gender"],
        maritalStatus: json["maritalStatus"],
        educationQualification: List<Vulnerability>.from(
            json["educationQualification"]
                .map((x) => Vulnerability.fromJson(x))),
        phoneNumber: json["phoneNumber"],
        aadharNumber: json["aadharNumber"],
        occupation: List<Vulnerability>.from(
            json["occupation"].map((x) => Vulnerability.fromJson(x))),
        workTimings: json["workTimings"],
        isADailyWageWorker: json["isADailyWageWorker"],
        incomePerDay: json["incomePerDay"],
        incomePerMonth: json["incomePerMonth"],
        specialSkills: json["specialSkills"],
        frequentHealthAilments: json["frequentHealthAilments"],
        communicableDiseases: json["communicableDiseases"],
        nonCommunicableDiseases: json["nonCommunicableDiseases"],
        surgeriesUndergone: json["surgeriesUndergone"],
        anganwadiServicesRendered: json["anganwadiServicesRendered"],
        anganwadiServicesUtilised: json["anganwadiServicesUtilised"],
        phcServicesUtilised: json["phcServicesUtilised"],
        privateHealthClinicFacilitiesUsed:
            json["privateHealthClinicFacilitiesUsed"],
        reasonsForVisitingPrivateHealthClinic:
            json["reasonsForVisitingPrivateHealthClinic"],
        tobaccoBasedProductsUsage: List<Vulnerability>.from(
            json["tobaccoBasedProductsUsage"]
                .map((x) => Vulnerability.fromJson(x))),
        vulnerabilities: List<Vulnerability>.from(
            json["Vulnerabilities"].map((x) => Vulnerability.fromJson(x))),
        alcoholConsumption: json["alcoholConsumption"],
        oldAgePension: json["oldAgePension"],
        businessStatus: json["businessStatus"],
        arogyaSethuAppInstallationStatus:
            json["arogyaSethuAppInstallationStatus"],
        vizhithiruAppInstallationStatus:
            json["vizhithiruAppInstallationStatus"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date": date,
        "gender": gender,
        "maritalStatus": maritalStatus,
        "educationQualification":
            List<dynamic>.from(educationQualification.map((x) => x.toJson())),
        "phoneNumber": phoneNumber,
        "aadharNumber": aadharNumber,
        "occupation": List<dynamic>.from(occupation.map((x) => x.toJson())),
        "workTimings": workTimings,
        "isADailyWageWorker": isADailyWageWorker,
        "incomePerDay": incomePerDay,
        "incomePerMonth": incomePerMonth,
        "specialSkills": specialSkills,
        "frequentHealthAilments": frequentHealthAilments,
        "communicableDiseases": communicableDiseases,
        "nonCommunicableDiseases": nonCommunicableDiseases,
        "surgeriesUndergone": surgeriesUndergone,
        "anganwadiServicesRendered": anganwadiServicesRendered,
        "anganwadiServicesUtilised": anganwadiServicesUtilised,
        "phcServicesUtilised": phcServicesUtilised,
        "privateHealthClinicFacilitiesUsed": privateHealthClinicFacilitiesUsed,
        "reasonsForVisitingPrivateHealthClinic":
            reasonsForVisitingPrivateHealthClinic,
        "tobaccoBasedProductsUsage": List<dynamic>.from(
            tobaccoBasedProductsUsage.map((x) => x.toJson())),
        "Vulnerabilities":
            List<dynamic>.from(vulnerabilities.map((x) => x.toJson())),
        "alcoholConsumption": alcoholConsumption,
        "oldAgePension": oldAgePension,
        "businessStatus": businessStatus,
        "arogyaSethuAppInstallationStatus": arogyaSethuAppInstallationStatus,
        "vizhithiruAppInstallationStatus": vizhithiruAppInstallationStatus,
      };
}

class Vulnerability {
  Vulnerability({
    required this.identifier,
  });

  String identifier;

  factory Vulnerability.fromJson(Map<String, dynamic> json) => Vulnerability(
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
      };
}
