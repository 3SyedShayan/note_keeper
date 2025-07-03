import 'package:flutter/material.dart';
import 'package:note_keeper/widgets/buttons.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({super.key, required this.noteDetailTitle});

  @override
  State<NoteDetail> createState() => _NoteDetailState();
  final String noteDetailTitle;
}

class _NoteDetailState extends State<NoteDetail> {
  List<String> items = ["chedckkr", "checkskr2", "checkkr3"];
  String? selectedItem;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Back button pressed')));
          },
        ),
        title: Text(widget.noteDetailTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Note Title',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormButton(title: "save", onPressed: () {}),
              SizedBox(width: 10),
              FormButton(title: "delete", onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
