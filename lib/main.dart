import 'package:cim_training/widgets/bodytitle.dart';
import 'package:cim_training/widgets/machintable.dart';
import 'package:cim_training/widgets/titleappbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MyApp> {
  final items = ['Wirecut', 'EDM', 'Grinding'];
  String? value;
  // Variable Example

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blueGrey[100], title: TitleAppBar()),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyTitle(bodyTitle: 'Title 1'),
                DropdownButton<String>(
                  value: value,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
                Divider(),
                MachineTable()
              ],
            ),
            color: Colors.yellow[50],
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
