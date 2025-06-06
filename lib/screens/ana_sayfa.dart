import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/completion_indicator.dart'; // Burada import ettik
import '../models/note.dart';
import '../services/note_service.dart';
import '../widgets/note_card.dart';
import '../utils/constants.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final NoteService _noteService = NoteService();
  final TextEditingController _controller = TextEditingController();

  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final loadedNotes = await _noteService.loadNotes();
    setState(() {
      _notes = loadedNotes;
    });
  }

  Future<void> _saveNotes() async {
    await _noteService.saveNotes(_notes);
  }

  void _addNote() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _notes.add(Note(text: text));
      _controller.clear();
    });
    _saveNotes();
  }

  void _toggleComplete(int index) {
    setState(() {
      _notes[index].isCompleted = !_notes[index].isCompleted;
    });
    _saveNotes();
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
    _saveNotes();
  }

  double get _completionPercentage {
    if (_notes.isEmpty) return 0;
    final completed = _notes.where((note) => note.isCompleted).length;
    return completed / _notes.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YKS KOÇU', style: GoogleFonts.raleway()),
        centerTitle: true,
        backgroundColor: AppColors.acikKahve,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.cikolata, AppColors.acikKahve],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.book, color: AppColors.cikolata),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.cikolata),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Bugünkü hedefini yaz...',
                      filled: true,
                      fillColor: AppColors.bej,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _addNote(),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addNote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.altinSari,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Icon(Icons.add, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: _notes.isEmpty
                ? Center(
                    child: Text(
                      'Notunuz yok, hemen ekleyin!',
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        color: AppColors.cikolata,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];
                      return NoteCard(
                        note: note,
                        onToggleComplete: () => _toggleComplete(index),
                        onDelete: () => _deleteNote(index),
                      );
                    },
                  ),
          ),

          // İşte burası: CompletionIndicator widget’ı çağırıldı
          CompletionIndicator(completionRate: _completionPercentage),
        ],
      ),
    );
  }
}
