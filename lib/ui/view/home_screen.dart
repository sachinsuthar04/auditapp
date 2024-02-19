import 'package:auditapp/model/audit_model.dart';
import 'package:auditapp/ui/controller/home_controller.dart';
import 'package:auditapp/ui/view/filter_screen.dart';
import 'package:auditapp/ui/widget/card_widget.dart';
import 'package:auditapp/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        dataController.getApi(isRefresh: true);
        return Future.value(null);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => const FilterScreen()))
                          .then((value) async {
                        var statusName = dataController.statusList
                            .where((status) => status.selected)
                            .toList();
                        String data = getStatusValue(statusName.first.status);
                        List<AuditModel> tempData = [];
                        if (data == "All") {
                          tempData = await dataController.fetchProducts();
                        } else {
                          if (data.isNotEmpty &&
                              dataController.selectedAuditNumber.isNotEmpty &&
                              dataController.selectedAuditNumber.isNotEmpty) {
                            tempData = await DatabaseHelper.db
                                .getFilterProductList(
                                    data,
                                    dataController.selectedAuditName,
                                    dataController.selectedAuditNumber);
                          } else if (data.isNotEmpty) {
                            // tempData = await DatabaseHelper.db
                            //     .getFilterRequestList(data);
                            List<AuditModel> tempDataNew =
                                await dataController.fetchProducts();
                            tempData = tempDataNew
                                .where((auditModel) =>
                                    auditModel.auditStaus!.contains(data))
                                .toList();
                          } else if (dataController
                              .selectedAuditNumber.isNotEmpty) {
                            tempData = await DatabaseHelper.db
                                .getAuditNumberdataa(
                                    dataController.selectedAuditNumber);
                          } else if (dataController
                              .selectedAuditName.isNotEmpty) {
                            tempData = await DatabaseHelper.db
                                .getFilterNamedataa(
                                    dataController.selectedAuditName);
                          }
                        }

                        dataController.userList = tempData;
                        setState(() {});

                        return dataController.userList;
                      })
                    },
                icon: const Icon(
                  Icons.filter_list_outlined,
                  color: Colors.black,
                )),
          ],
          centerTitle: true,
        ),
        body: Obx(() => dataController.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'My Audit'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10).copyWith(top: 3),
                    child: Text(
                      'Internal Audit'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: dataController.userList.isNotEmpty
                        ? ListView.builder(
                            itemCount: dataController.userList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CardWidget(
                                      model: dataController.userList[index]),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            })
                        : const Center(child: Text("No data available")),
                  ),
                ],
              )),
      ),
    );
  }

  String getStatusValue(String status) {
    String updated = "All";
    if (status == "Rejected") {
      updated = "Cancelled";
    } else if (status == "Requested") {
      updated = "Requested Auditor";
    } else if (status == "Supplier") {
      updated = "Requested Auditee";
    } else if (status == "Released") {
      updated = "Supplier Responded";
    }
    return updated;
  }
}
