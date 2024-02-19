import 'package:auditapp/model/audit_model.dart';
import 'package:auditapp/model/filter_models.dart';
import 'package:auditapp/ui/controller/home_controller.dart';
import 'package:auditapp/ui/widget/chip_button.dart';
import 'package:auditapp/ui/widget/date_widget.dart';
import 'package:auditapp/ui/widget/multidropdown_widget.dart';
import 'package:auditapp/ui/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  DataController dataController = Get.put(DataController());
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  final MultiSelectController<User> auditNameController =
      MultiSelectController();
  final MultiSelectController<User> auditNumberController =
      MultiSelectController();
  final MultiSelectController<User> businessUnitController =
      MultiSelectController();
  final MultiSelectController<User> plantController = MultiSelectController();
  final MultiSelectController<User> zoneController = MultiSelectController();
  final MultiSelectController<User> auditeeController = MultiSelectController();
  final MultiSelectController<User> auditorController = MultiSelectController();
  final MultiSelectController<User> approverController =
      MultiSelectController();
  final MultiSelectController<User> reviewerController =
      MultiSelectController();

  @override
  void initState() {
    super.initState();
    setFilterDataFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: const Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Filters'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //filter dropdown
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Status'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        clipBehavior: Clip.none,
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        children: [
                          for (int i = 0;
                              i < dataController.statusList.length;
                              i++)
                            InkWell(
                              onTap: () {
                                int index = dataController.statusList
                                    .indexWhere((element) =>
                                        element.status ==
                                        dataController.statusList[i].status);
                                for (int i = 0;
                                    i < dataController.statusList.length;
                                    i++) {
                                  if (index == i) {
                                    dataController.statusList[i].selected =
                                        true;
                                  } else {
                                    dataController.statusList[i].selected =
                                        false;
                                  }
                                }
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: ChipButton(
                                  height: 40,
                                  text: dataController.statusList[i].status,
                                  isSelected:
                                      dataController.statusList[i].selected,
                                ),
                              ),
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DateWidget(
                              onChange: (date) {
                                startDateController.text = date;
                              },
                              controller: startDateController,
                              labelName: 'Start Date',
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: DateWidget(
                              onChange: (date) {
                                endDateController.text = date;
                              },
                              controller: endDateController,
                              labelName: 'End Date',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        optionItem: dataController.auditNameList,
                        controller: auditNameController,
                        selectedData: (selectedAuditName) {
                          dataController.selectedAuditName = selectedAuditName;
                        },
                        hint: "Select Audit Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        optionItem: dataController.auditNumberList,
                        controller: auditNumberController,
                        selectedData: (selectedAuditNumber) {
                          dataController.selectedAuditNumber =
                              selectedAuditNumber;
                        },
                        hint: "Select Audit Number",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        controller: businessUnitController,
                        selectedData: (businessUnit) {
                          dataController.selectedBusinessUnit = businessUnit;
                        },
                        hint: "Select Business Unit",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        controller: zoneController,
                        selectedData: (zone) {
                          dataController.selectedZone = zone;
                        },
                        hint: "Select Zone A",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        optionItem: dataController.plantList,
                        controller: plantController,
                        selectedData: (plant) {
                          dataController.selectedPlant = plant;
                        },
                        hint: "Select Plant",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        controller: auditeeController,
                        selectedData: (auditee) {
                          dataController.selectedAuditee = auditee;
                        },
                        hint: "Select Auditee",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        controller: auditorController,
                        selectedData: (auditor) {
                          dataController.selectedAuditor = auditor;
                        },
                        hint: "Select Auditor",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        controller: approverController,
                        selectedData: (approver) {
                          dataController.selectedApprover = approver;
                        },
                        hint: "Select Approver",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MultiDropDownWidget(
                        controller: reviewerController,
                        selectedData: (reviewer) {
                          dataController.selectedReviewer = reviewer;
                        },
                        hint: "Select Reviewer",
                      ),
                    ],
                  ),
                ),
              ),

              // bottom button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {
                          // apply filter
                          filterData();
                        },
                        text: "Filter",
                        color: const Color(0xFF56B65C),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () async {
                          dataController.insertStatusData();

                          ///for fetch record fromDB
                          List<AuditModel> userList =
                              await dataController.fetchProducts();
                          dataController.userList = userList;
                          setState(() {});
                          Navigator.pop(context);
                        },
                        text: "Clear",
                        color: const Color(0xFF515251),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void filterData() {
    Navigator.pop(context);
  }

  Future<void> setFilterDataFromDb() async {
    // Future.delayed(const Duration(seconds: 2), () async {
    //NAME
    var data = await dataController.fetchNames();
    dataController.auditNameList = data;
    //NUMBER
    var data1 = await dataController.fetchNumber();
    dataController.auditNumberList = data1;

    //PLANT
    var dataPlant = await dataController.fetchPlant();
    dataController.plantList = dataPlant;
    setState(() {});
    // });
  }
}
