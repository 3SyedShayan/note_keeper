import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
