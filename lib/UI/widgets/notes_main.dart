import 'package:flutter/material.dart';

class NotesMain extends StatefulWidget {
  const NotesMain({super.key});

  @override
  State<NotesMain> createState() => _NotesMainState();
}

class _NotesMainState extends State<NotesMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: ListView.builder(
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Text('dsa');
          },
        ),
      ),
    );
  }
}
