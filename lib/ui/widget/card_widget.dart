import 'package:auditapp/model/audit_model.dart';
import 'package:auditapp/ui/widget/primary_button.dart';
import 'package:auditapp/ui/widget/text_time_widget.dart';
import 'package:auditapp/ui/widget/text_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  final AuditModel model;

  const CardWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextTimeWidget(
                    date: DateFormat('dd-MM-yyyy')
                        .format(model.requestDate ?? DateTime.now())
                        .toString()),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  model.auditStaus.toString(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                )
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.auditName.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            TextValueWidget(
                keyName: "Number", value: model.auditNumber.toString() ?? ""),
            const SizedBox(
              height: 6,
            ),
            TextValueWidget(
              keyName: "Plant",
              value: model.plantName.toString(),
              fontSize: 14,
            ),
            const SizedBox(
              height: 6,
            ),
            TextValueWidget(
              keyName: "Audit Coordinator",
              value: model.internalCoordinator.toString(),
              fontSize: 14,
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                alignment: WrapAlignment.end,
                spacing: 10,
                children: [
                  model.isSelfAudit == 1
                      ? PrimaryButton(
                          onPressed: () {},
                          height: 40,
                          text: "Self",
                          color: Colors.blue,
                        )
                      : const SizedBox.shrink(),
                  model.isOffSiteAudit == 1
                      ? PrimaryButton(
                          onPressed: () {},
                          height: 40,
                          text: "Offsite",
                          color: Colors.orange,
                        )
                      : const SizedBox.shrink(),
                  model.isOnSiteAudit == 1
                      ? PrimaryButton(
                          onPressed: () {},
                          height: 40,
                          text: "Onsite",
                          color: const Color(0xFF56B65C),
                        )
                      : const SizedBox.shrink(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Icon(Icons.remove_red_eye_rounded, color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
