import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class NoteService {
  static const _key = 'notes';

  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(notes.map((e) => e.toJson()).toList());
    await prefs.setString(_key, encoded);
  }

  Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString(_key);
    if (encoded == null) return [];
    final decoded = jsonDecode(encoded) as List;
    return decoded.map((e) => Note.fromJson(e)).toList();
  }
}
