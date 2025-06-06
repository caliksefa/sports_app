import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;
  final Function(int) onDelete;
  final Function(int) onToggleComplete;

  NoteList({
    required this.notes,
    required this.onDelete,
    required this.onToggleComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: Checkbox(
                value: note.isCompleted,
                onChanged: (_) => onToggleComplete(index),
              ),
              title: Text(
                note.text,
                style: TextStyle(
                  decoration: note.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDelete(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
