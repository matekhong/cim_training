import 'package:cim_training/api/data_api.dart';
import 'package:cim_training/model/machinestatus.dart';
import 'package:flutter/material.dart';

class MachineStatusTable extends StatelessWidget {
  final String machineGR;
  const MachineStatusTable({
    Key? key,
    required this.machineGR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> columns = [
      'Machine GR',
      'Machine Code',
      'Mold No',
      'Part No',
      'Worker Name',
      'Start Time'
    ];

    return FutureBuilder(
        future: DataApi.fetchFilterMachineStatus(machineGR),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var machines = snapshot.data as List<MachineStatus>;
            return DataTable(
              sortColumnIndex: 5,
              sortAscending: true,
              columns: [
                for (String column in columns) DataColumn(label: Text(column)),
              ],
              rows: [
                for (MachineStatus machine in machines)
                  DataRow(
                      color: machine.moldNo != null
                          ? MaterialStateColor.resolveWith(
                              (states) => Colors.pink)
                          : MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                      cells: [
                        DataCell(Text(
                          machine.machgrCd.toString(),
                        )),
                        DataCell(
                            Text(
                              machine.machCd.toString(),
                            ),
                            showEditIcon:
                                machine.moldNo != null ? true : false),
                        DataCell(Text(machine.moldNo == null
                            ? ''
                            : machine.moldNo.toString())),
                        DataCell(Text(machine.partsNo == null
                            ? ''
                            : machine.partsNo.toString())),
                        DataCell(Text(machine.workerName == null
                            ? ''
                            : machine.workerName.toString())),
                        DataCell(Text(machine.startupTime == null
                            ? ''
                            : machine.startupTime.toString())),
                      ])
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
