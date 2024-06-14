import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/main.dart';

class NotesMain extends StatefulWidget {
  const NotesMain({super.key});

  @override
  State<NotesMain> createState() => _NotesMainState();
}

class _NotesMainState extends State<NotesMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Заметки',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: const Text('Title'),
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  TextFormField(
                    onFieldSubmitted: (value) async {
                      return supabase.from('notes').insert({'body': value});
                    },
                  )
                ],
              );
            },
          );
        },
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
