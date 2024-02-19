import 'dart:developer';

import 'package:auditapp/model/audit_model.dart';
import 'package:auditapp/model/filter_models.dart';
import 'package:auditapp/service/service_base.dart';
import 'package:auditapp/utils/database_helper.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class DataController extends GetxController {
  List<AuditModel> userList = [];
  var isDataLoading = false.obs;

  //filter data
  var statusList = [].obs;
  /// default list
  List<ValueItem<User>> auditNameList = [];
  List<ValueItem<User>> auditNumberList = [];
  List<ValueItem<User>> businessUnitList = [];
  List<ValueItem<User>> zoneList = [];
  List<ValueItem<User>> plantList = [];
  List<ValueItem<User>> auditeeList = [];
  List<ValueItem<User>> auditorList = [];
  List<ValueItem<User>> approverList = [];
  List<ValueItem<User>> reviewerList = [];

  ///selected value
  List<ValueItem<User>> selectedAuditName = [];
  List<ValueItem<User>> selectedAuditNumber = [];
  List<ValueItem<User>> selectedBusinessUnit = [];
  List<ValueItem<User>> selectedZone = [];
  List<ValueItem<User>> selectedPlant = [];
  List<ValueItem<User>> selectedAuditee = [];
  List<ValueItem<User>> selectedAuditor = [];
  List<ValueItem<User>> selectedApprover = [];
  List<ValueItem<User>> selectedReviewer = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    insertStatusData();

    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    try {
      isDataLoading(true);

      ///for fetch record fromDB
      userList = await fetchProducts();
      if (userList.isEmpty) {
        userList = [];
        final response =
            await ServiceBase.get(url: ServiceBase.baseUrl, headers: {
          'Authorization':
              '68d420488470fb5305cad01a6fc7238cb5737005298daabb8bb4a3ac1c994178~1000003',
          'Content-Type': 'application/json',
        });
        for (var element in response) {
          userList.add(AuditModel.fromJson(element));
        }

        ///Store data in DB
        addProduct(userList);
        print('datafrom INSERTED intoDB== ${userList.length}');
      } else {
        print('getdatafrom DATABASE== ${userList.length}');
      }
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  Future<List<AuditModel>> fetchProducts() async {
    return DatabaseHelper.db.getProductList();
  }

  Future<void> addProduct(List<AuditModel> userList) async {
    DatabaseHelper.db.deleteTable();
    DatabaseHelper.db.insertProduct(userList);
  }

  void insertStatusData() {
    statusList=[].obs;
    statusList.add(FilterModel(status: 'All', selected: true));
    statusList.add(FilterModel(status: 'Rejected', selected: false));
    statusList.add(FilterModel(status: 'Requested', selected: false));
    statusList.add(FilterModel(status: 'Released', selected: false));
    statusList.add(FilterModel(status: 'Closed', selected: false));
  }

  Future<List<ValueItem<User>>> fetchNames() async {
    return  DatabaseHelper.db.getAuditName();
  }
  Future<List<ValueItem<User>>> fetchNumber() async {
    return  DatabaseHelper.db.getAuditNumber();
  }
  Future<List<ValueItem<User>>> fetchPlant() async {
    return  DatabaseHelper.db.getPlant();
  }
}
