import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:objectbox/objectbox.dart';
import 'package:intl/intl.dart';

@Entity()
class FamilyMemberIndividualDataModel {
  int id = 0;
  String? userName;
  String? dateOfBirth;
  String? gender;
  String? phoneNumber;
  String? educationQualification;
  String? aadhaarNumber;
  List<String>? vulnerabilities;
  List<String>? occupation;
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
}

@Entity()
class FamilyMembersCommonDataModel {
  int id = 0;
  Position? locationTopLeft;
  Position? locationTopRight;
  Position? locationBottomLeft;
  Position? locationBottomRight;
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

  FamilyMembersCommonDataModel({
    //this.keys,
    this.locationBottomLeft,
    this.locationBottomRight,
    this.locationTopLeft,
    this.locationTopRight,
  });
}
