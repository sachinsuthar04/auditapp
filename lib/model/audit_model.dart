// To parse this JSON data, do
//
//     final auditModel = auditModelFromJson(jsonString);

import 'dart:convert';

List<AuditModel> auditModelFromJson(String str) =>
    List<AuditModel>.from(json.decode(str).map((x) => AuditModel.fromJson(x)));

String auditModelToJson(List<AuditModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuditModel {
  int? id;
  DateTime? requestDate;
  String? auditStaus;
  String? auditName;
  String? auditNumber;
  int? plantId;
  String? plantName;
  DateTime? insertionDate;
  DateTime? updatedDate;
  int? isInternal;
  int? isSelfAudit;
  int? isOnSiteAudit;
  int? isOffSiteAudit;
  int? isMyAudit;
  DateTime? selfAuditStartDate;
  DateTime? selfAuditEndDate;
  DateTime? onsiteAuditStartDate;
  DateTime? onsiteAuditEndDate;
  DateTime? offsiteAuditStartDate;
  DateTime? offsiteAuditEndDate;
  String? auditType;
  String? supplierName;
  String? description;
  int? templateId;
  String? templateName;
  String? auditTypeName;
  int? internalCoordinatorId;
  String? internalCoordinator;
  List<OffsiteAuditor>? supplierCoordinators;
  List<OffsiteAuditor>? onsiteAuditors;
  List<OffsiteAuditor>? offsiteAuditors;
  List<OffsiteAuditor>? reviewers;

  AuditModel({
    this.id,
    this.requestDate,
    this.auditStaus,
    this.auditName,
    this.auditNumber,
    this.plantId,
    this.plantName,
    this.insertionDate,
    this.updatedDate,
    this.isInternal,
    this.isSelfAudit,
    this.isOnSiteAudit,
    this.isOffSiteAudit,
    this.isMyAudit,
    this.selfAuditStartDate,
    this.selfAuditEndDate,
    this.onsiteAuditStartDate,
    this.onsiteAuditEndDate,
    this.offsiteAuditStartDate,
    this.offsiteAuditEndDate,
    this.auditType,
    this.supplierName,
    this.description,
    this.templateId,
    this.templateName,
    this.auditTypeName,
    this.internalCoordinatorId,
    this.internalCoordinator,
    this.supplierCoordinators,
    this.onsiteAuditors,
    this.offsiteAuditors,
    this.reviewers,
  });

  factory AuditModel.fromJson(Map<String, dynamic> json,
          {bool fromDb = false}) =>
      AuditModel(
        id: json["id"],
        requestDate: json["requestDate"] == null
            ? null
            : DateTime.parse(json["requestDate"]),
        auditStaus: json["auditStaus"],
        auditName: json["auditName"],
        auditNumber: json["auditNumber"],
        plantId: json["plantId"],
        plantName: json["plantName"],
        insertionDate: json["insertionDate"] == null
            ? null
            : DateTime.parse(json["insertionDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        isInternal: fromDb
            ? json["isInternal"] == 1
                ? 1
                : 0
            : json["isInternal"]
                ? 1
                : 0,
        isSelfAudit: fromDb
            ? json["isSelfAudit"] == 1
                ? 1
                : 0
            : json["isSelfAudit"]
                ? 1
                : 0,
        isOnSiteAudit: fromDb
            ? json["isOnSiteAudit"] == 1
                ? 1
                : 0
            : json["isOnSiteAudit"]
                ? 1
                : 0,
        isOffSiteAudit: fromDb
            ? json["isOffSiteAudit"] == 1
                ? 1
                : 0
            : json["isOffSiteAudit"]
                ? 1
                : 0,
        isMyAudit: fromDb
            ? json["isMyAudit"] == 1
                ? 1
                : 0
            : json["isMyAudit"]
                ? 1
                : 0,
        selfAuditStartDate: json["selfAuditStartDate"] == null
            ? null
            : DateTime.parse(json["selfAuditStartDate"]),
        selfAuditEndDate: json["selfAuditEndDate"] == null
            ? null
            : DateTime.parse(json["selfAuditEndDate"]),
        onsiteAuditStartDate: json["onsiteAuditStartDate"] == null
            ? null
            : DateTime.parse(json["onsiteAuditStartDate"]),
        onsiteAuditEndDate: json["onsiteAuditEndDate"] == null
            ? null
            : DateTime.parse(json["onsiteAuditEndDate"]),
        offsiteAuditStartDate: json["offsiteAuditStartDate"] == null
            ? null
            : DateTime.parse(json["offsiteAuditStartDate"]),
        offsiteAuditEndDate: json["offsiteAuditEndDate"] == null
            ? null
            : DateTime.parse(json["offsiteAuditEndDate"]),
        auditType: json["auditType"],
        supplierName: json["supplierName"],
        description: json["description"],
        templateId: json["templateId"],
        templateName: json["templateName"],
        auditTypeName: json["auditTypeName"],
        internalCoordinatorId: json["internalCoordinatorId"],
        internalCoordinator: json["internalCoordinator"] ?? "",
        supplierCoordinators: json["supplierCoordinators"] == null
            ? []
            : List<OffsiteAuditor>.from(json["supplierCoordinators"]!
                .map((x) => OffsiteAuditor.fromJson(x))),
        onsiteAuditors: json["onsiteAuditors"] == null
            ? []
            : List<OffsiteAuditor>.from(
                json["onsiteAuditors"]!.map((x) => OffsiteAuditor.fromJson(x))),
        offsiteAuditors: json["offsiteAuditors"] == null
            ? []
            : List<OffsiteAuditor>.from(json["offsiteAuditors"]!
                .map((x) => OffsiteAuditor.fromJson(x))),
        reviewers: json["reviewers"] == null
            ? []
            : List<OffsiteAuditor>.from(
                json["reviewers"]!.map((x) => OffsiteAuditor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "requestDate": requestDate?.toIso8601String(),
        "auditStaus": auditStaus,
        "auditName": auditName,
        "auditNumber": auditNumber,
        "plantId": plantId,
        "plantName": plantName,
        "insertionDate": insertionDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "isInternal": isInternal,
        "isSelfAudit": isSelfAudit,
        "isOnSiteAudit": isOnSiteAudit,
        "isOffSiteAudit": isOffSiteAudit,
        "isMyAudit": isMyAudit,
        "selfAuditStartDate": selfAuditStartDate?.toIso8601String(),
        "selfAuditEndDate": selfAuditEndDate?.toIso8601String(),
        "onsiteAuditStartDate": onsiteAuditStartDate?.toIso8601String(),
        "onsiteAuditEndDate": onsiteAuditEndDate?.toIso8601String(),
        "offsiteAuditStartDate": offsiteAuditStartDate?.toIso8601String(),
        "offsiteAuditEndDate": offsiteAuditEndDate?.toIso8601String(),
        "auditType": auditType,
        "supplierName": supplierName,
        "description": description,
        "templateId": templateId,
        "templateName": templateName,
        "auditTypeName": auditTypeName,
        "internalCoordinatorId": internalCoordinatorId,
        "internalCoordinator": internalCoordinator,
        // "supplierCoordinators": supplierCoordinators == null
        //     ? []
        //     : List<dynamic>.from(supplierCoordinators!.map((x) => x.toJson())),
        // "onsiteAuditors": onsiteAuditors == null
        //     ? []
        //     : List<dynamic>.from(onsiteAuditors!.map((x) => x.toJson())),
        // "offsiteAuditors": offsiteAuditors == null
        //     ? []
        //     : List<dynamic>.from(offsiteAuditors!.map((x) => x.toJson())),
        // "reviewers": reviewers == null
        //     ? []
        //     : List<dynamic>.from(reviewers!.map((x) => x.toJson())),
      };
}

class OffsiteAuditor {
  int? userId;
  String? name;

  OffsiteAuditor({
    this.userId,
    this.name,
  });

  factory OffsiteAuditor.fromJson(Map<String, dynamic> json) => OffsiteAuditor(
        userId: json["userId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
      };
}
