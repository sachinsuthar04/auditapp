import 'dart:io';

import 'package:auditapp/model/audit_model.dart';
import 'package:auditapp/model/filter_models.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _productDb;
  static DatabaseHelper? _databaseHelper;

  String table = 'auditTable';
  String supplierTable = 'supplierCoordinators';
  String onsiteTable = 'onsiteAuditors';
  String offsiteTable = 'offsiteAuditors';
  String reviewersTable = 'reviewers';

  String colId = 'id';
  String colRequestDate = 'requestDate';
  String colAuditStaus = "auditStaus";
  String colAuditName = "auditName";
  String colAuditNumber = 'auditNumber';
  String colPlantId = "plantId";
  String colPlantName = "plantName";
  String colInsertionDate = 'insertionDate';
  String colUpdatedDate = "updatedDate";
  String colIsInternal = "isInternal";
  String colIsSelfAudit = 'isSelfAudit';
  String colIsOnSiteAudit = "isOnSiteAudit";
  String colIsOffSiteAudit = 'isOffSiteAudit';
  String colisMyAudit = 'isMyAudit';
  String colselfAuditStartDate = "selfAuditStartDate";
  String colselfAuditEndDate = "selfAuditEndDate";
  String colOnsiteAuditStartDate = 'onsiteAuditStartDate';
  String colOnsiteAuditEndDate = 'onsiteAuditEndDate';
  String colOffsiteAuditStartDate = "offsiteAuditStartDate";
  String colOffsiteAuditEndDate = "offsiteAuditEndDate";
  String colAuditType = 'auditType';
  String colSupplierName = 'supplierName';
  String colDescription = "description";
  String colTemplateId = "templateId";
  String colTemplateName = 'templateName';
  String colAuditTypeName = 'auditTypeName';
  String colInternalCoordinatorId = "internalCoordinatorId";
  String colInternalCoordinator = "internalCoordinator";

  DatabaseHelper._createInstance();

  static final DatabaseHelper db = DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _productDb ??= await initializeDatabase();
    return _productDb!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}audit.db';
    var myDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return myDatabase;
  }

  // void _createDb(Database db, int newVersion) async {
  // await db.execute("CREATE TABLE $table"
  //     "($colId LONG,"
  //     "$colTitle TEXT, $colFirstName TEXT, $colLastName TEXT, $colImage TEXT)");
  // await db.execute('CREATE TABLE $cartTable'
  //     "($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
  //     "$colName TEXT, $colDescription TEXT, $colPrice TEXT, $colImage TEXT)");
  // }
  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $table"
        "($colId INTEGER,"
        "$colRequestDate INTEGER, $colAuditStaus TEXT, "
        "$colAuditName TEXT, $colAuditNumber TEXT,"
        "$colPlantId INTEGER, $colPlantName TEXT,"
        "$colInsertionDate INTEGER, $colUpdatedDate INTEGER,"
        "$colIsInternal INTEGER, $colIsSelfAudit INTEGER,"
        "$colIsOnSiteAudit INTEGER, $colIsOffSiteAudit INTEGER,"
        "$colisMyAudit INTEGER,"
        "$colselfAuditStartDate INTEGER, $colselfAuditEndDate INTEGER,"
        "$colOnsiteAuditStartDate INTEGER, $colOnsiteAuditEndDate INTEGER,"
        "$colOffsiteAuditStartDate INTEGER, $colOffsiteAuditEndDate INTEGER,"
        "$colAuditType TEXT, $colSupplierName TEXT,"
        "$colDescription TEXT, $colTemplateId INTEGER,"
        "$colTemplateName TEXT,"
        "$colAuditTypeName TEXT, $colInternalCoordinatorId INTEGER,"
        "$colInternalCoordinator TEXT)");
  }

  Future<List<Map<String, dynamic>>> getProductMapList() async {
    Database db = await database;
    var result = await db.query(table, orderBy: "$colId ASC");
    return result;
  }

  void insertProduct(List<AuditModel> userList) async {
    Database db = await database;
    for (AuditModel item in userList) {
      var result = await db.insert(table, item.toJson());
      print(result);
    }
  }

  void deleteTable() async {
    Database db = await database;
    await db.delete(table);
  }

  Future<List<AuditModel>> getProductList() async {
    var productMapList = await getProductMapList();
    List<AuditModel> productList = <AuditModel>[];
    for (int i = 0; i < productMapList.length; i++) {
      productList.add(AuditModel.fromJson(productMapList[i], fromDb: true));
    }
    return productList;
  }

  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }

  Future<List<ValueItem<User>>> getAuditName() async {
    Database db = await database;
    var result = await db.rawQuery('SELECT $colAuditName from $table');
    List<ValueItem<User>> name = [];
    for (int i = 0; i < result.length; i++) {
      final Map<String, dynamic> names = {
        colAuditName: result[i][colAuditName],
      };
      name.add(ValueItem(
        label: names[colAuditName] ?? "",
        value: User(id: i, name: names[colAuditName] ?? ""),
      ));
    }
    return name;
  }

  Future<List<ValueItem<User>>> getAuditNumber() async {
    Database db = await database;
    var result = await db.rawQuery('SELECT $colAuditNumber from $table');
    List<ValueItem<User>> name = [];
    for (int i = 0; i < result.length; i++) {
      final Map<String, dynamic> names = {
        colAuditNumber: result[i][colAuditNumber],
      };
      if (result[i][colAuditNumber] != null &&
          result[i][colAuditNumber] != "") {
        name.add(ValueItem(
          label: names[colAuditNumber],
          value: User(id: i, name: names[colAuditNumber]),
        ));
      }
    }
    return name;
  }

  Future<List<ValueItem<User>>> getPlant() async {
    Database db = await database;
    var result = await db.rawQuery('SELECT $colPlantName from $table');
    List<ValueItem<User>> name = [];
    for (int i = 0; i < result.length; i++) {
      final Map<String, dynamic> names = {
        colPlantName: result[i][colPlantName],
      };
      if (result[i][colPlantName] != null && result[i][colPlantName] != "") {
        name.add(ValueItem(
          label: names[colPlantName],
          value: User(id: i, name: names[colPlantName]),
        ));
      }
    }
    return name;
  }

  Future<List<AuditModel>> getFilterProductList(String dataRequest,
      List<ValueItem<User>> name, List<ValueItem<User>> number) async {
    var productMapList =
        await getFilterProductMapList(dataRequest, name, number);
    List<AuditModel> productList = <AuditModel>[];
    for (int i = 0; i < productMapList.length; i++) {
      productList.add(AuditModel.fromJson(productMapList[i], fromDb: true));
    }
    return productList;
  }

  Future<List<AuditModel>> getFilterRequestList(String dataRequest) async {
    var productMapList = await getRequestFilter(dataRequest);
    List<AuditModel> productList = <AuditModel>[];
    for (int i = 0; i < productMapList.length; i++) {
      productList.add(AuditModel.fromJson(productMapList[i], fromDb: true));
    }
    return productList;
  }

  Future<List<AuditModel>> getFilterNamedataa(
    List<ValueItem<User>> name,
  ) async {
    var productMapList = await getFilterAuditNameList(
      name,
    );
    List<AuditModel> productList = <AuditModel>[];
    for (int i = 0; i < productMapList.length; i++) {
      productList.add(AuditModel.fromJson(productMapList[i], fromDb: true));
    }
    return productList;
  }

  Future<List<AuditModel>> getAuditNumberdataa(
    List<ValueItem<User>> number,
  ) async {
    var productMapList = await getFilterAuditNumberList(
      number,
    );
    List<AuditModel> productList = <AuditModel>[];
    for (int i = 0; i < productMapList.length; i++) {
      productList.add(AuditModel.fromJson(productMapList[i], fromDb: true));
    }
    return productList;
  }

  Future<List<Map<String, dynamic>>> getFilterProductMapList(String dataRequest,
      List<ValueItem<User>> name, List<ValueItem<User>> number) async {
    var temp = [];
    List<String> temp1 = [];
    String nameData = '';
    String numberData = '';

    for (int i = 0; i < name.length; i++) {
      temp.add(name[i].label);
    }
    var str = '"${temp.map((s) => "'$s'").toList()}"';
    nameData = str.replaceAll('"', "").replaceAll("[", "").replaceAll("]", "");

    for (int i = 0; i < number.length; i++) {
      temp1.add(number[i].label);
    }
    var str1 = '"${temp1.map((s) => "'$s'").toList()}"';
    numberData =
        str1.replaceAll('"', "").replaceAll("[", "").replaceAll("]", "");
    Database db = await database;
    var result = await db.rawQuery("SELECT * from $table WHERE"
        " $colAuditName IN ($nameData) AND "
        "$colAuditNumber IN ($numberData) AND "
        "$colRequestDate = '$dataRequest'");
    return result;
  }

  Future<List<Map<String, dynamic>>> getRequestFilter(
      String dataRequest) async {
    Database db = await database;
    var result = await db.rawQuery("SELECT * from $table WHERE "
        "$colRequestDate = '$dataRequest' ");
    return result;
  }

  Future<List<Map<String, dynamic>>> getFilterAuditNameList(
      List<ValueItem<User>> name) async {
    var temp = [];
    String nameData = '';

    for (int i = 0; i < name.length; i++) {
      temp.add(name[i].label);
    }
    var str = '"${temp.map((s) => "'$s'").toList()}"';
    nameData = str.replaceAll('"', "").replaceAll("[", "").replaceAll("]", "");

    Database db = await database;
    var result = await db.rawQuery("SELECT * from $table WHERE"
        " $colAuditName IN ($nameData)");
    return result;
  }

  Future<List<Map<String, dynamic>>> getFilterAuditNumberList(
      List<ValueItem<User>> number) async {
    var temp = [];
    String numberData = '';

    for (int i = 0; i < number.length; i++) {
      temp.add(number[i].label);
    }
    var str = '"${temp.map((s) => "'$s'").toList()}"';
    numberData =
        str.replaceAll('"', "").replaceAll("[", "").replaceAll("]", "");

    Database db = await database;
    var result = await db.rawQuery("SELECT * from $table WHERE"
        " $colAuditNumber IN ($numberData)");
    return result;
  }
}
