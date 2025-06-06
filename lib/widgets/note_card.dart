import 'package:flutter/material.dart';
import '../models/note.dart';
import '../utils/constants.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onToggleComplete;
  final VoidCallback onDelete;

  const NoteCard({
    Key? key,
    required this.note,
    required this.onToggleComplete,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.acikKahve,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          note.text,
          style: TextStyle(
            fontSize: 18,
            color: note.isCompleted ? Colors.grey : AppColors.cikolata,
            decoration: note.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Checkbox(
          value: note.isCompleted,
          activeColor: AppColors.altinSari,
          onChanged: (_) => onToggleComplete(),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
