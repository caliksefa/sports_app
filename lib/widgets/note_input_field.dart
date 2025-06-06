import 'package:flutter/material.dart';

class NoteInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  NoteInputField({required this.controller, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Yeni notunu yaz...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(onPressed: onAdd, child: Text("Ekle")),
        ],
      ),
    );
  }
}
