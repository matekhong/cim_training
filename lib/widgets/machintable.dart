import 'package:cim_training/model/machinestatus.dart';
import 'package:flutter/material.dart';

class MachineTable extends StatelessWidget {
  const MachineTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MachineStatus> statusMachines;
    List<String> columns = ['Machine Code', 'Capacity', 'Plan', 'Actual'];
    statusMachines = [
      MachineStatus('MC01', '600', '500', '650'), //0
      MachineStatus('MC02', '400', '600', '350'), //1
      MachineStatus('MC03', '300', '500', '750'),
      MachineStatus('MC04', '300', '500', '750'),
      MachineStatus('MC05', '300', '500', '750') //2
    ];

    return DataTable(
      sortColumnIndex: 0,
      sortAscending: true,
      columns: [
        for (String column in columns) DataColumn(label: Text(column)),
      ],
      rows: [
        for (MachineStatus statusMachine in statusMachines)
          DataRow(cells: [
            DataCell(Text(statusMachine.machineCode)),
            DataCell(Text(statusMachine.capacity), showEditIcon: true),
            DataCell(Text(statusMachine.plan)),
            DataCell(Text(statusMachine.actual)),
          ]),
      ],
    );
  }
}
