import 'package:cim_training/widgets/bodytitle.dart';
import 'package:cim_training/widgets/machin_table.dart';
import 'package:cim_training/widgets/titleappbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MyApp> {
  final items = ['ED', 'EB', 'EDM'];
  String? dropdownId;
  String? name;
  // Variable Example

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blueGrey[100], title: TitleAppBar()),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyTitle(bodyTitle: 'Title 1'),
                DropdownButton<String>(
                  value: dropdownId,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (selectedId) =>
                      setState(() => dropdownId = selectedId),
                ),
                Divider(),
                MachineStatusTable(machineGR: dropdownId.toString())
              ],
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
