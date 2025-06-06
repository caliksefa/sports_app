class Note {
  String text;
  bool isCompleted;

  Note({required this.text, this.isCompleted = false});

  Map<String, dynamic> toJson() => {'text': text, 'isCompleted': isCompleted};

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(text: json['text'], isCompleted: json['isCompleted']);
}
