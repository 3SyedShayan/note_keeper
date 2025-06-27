import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({super.key});

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  List<String> items = ["chedckkr", "checkskr2", "checkkr3"];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton(
            value: selectedItem ?? items[0],
            items:
                items
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Selected: $value')));
            },
          ),
        ],
      ),
    );
  }
}
