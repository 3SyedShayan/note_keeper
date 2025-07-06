import 'package:flutter/material.dart';
import 'package:note_keeper/models/note.dart';
import 'package:note_keeper/screens/note_detail.dart';
import 'package:note_keeper/services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? notes;
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      case 3:
      default:
        return Colors.yellow;
    }
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
      case 2:
        return Icon(Icons.arrow_right, color: Colors.yellow);
      default:
        return Icon(Icons.arrow_right, color: Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NoteDetail(noteDetailTitle: "Add Title");
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Floating Action Button Pressed')),
          );
        },
        child: Icon(Icons.add),
      ),

      appBar: AppBar(
        title: Text('Note Keeper'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Add Note button pressed')),
              );
            },
          ),
        ],
      ),
      body: getNoteListView(),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.headlineLarge!;
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Note ${index + 1}'),
            subtitle: Text('This is the content of note ${index + 1}.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NoteDetail(noteDetailTitle: "Edit Title");
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on Note ${index + 1}')),
              );
            },
            leading: Icon(Icons.note),
            trailing: Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}
