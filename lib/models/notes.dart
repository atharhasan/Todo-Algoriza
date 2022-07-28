final String tableNotes = 'notes';

class NotesField {
  static final String id = '_id';
  static final String title = 'title';
  static final String date = 'date';
  static final String startTime = 'startTime';
  static final String endTime = 'endTime';
  static final String taskColor = 'taskColor';
  static final String isCompleted = 'isCompleted';
  static final String remind = 'remind';
  static final String repeat = 'repeat';
}

class Notes {
  int? id;
  late String title;
  String? date;
  String? startTime;
  String? endTime;
  String? remind;
  String? repeat;
  int? taskColor;
  int? isCompleted;

  Notes({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
  });

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    remind = json['remind'];
    repeat = json['repeat'];
    taskColor = json['taskColor'];
    isCompleted = json['isCompleted'];
  }

  Map<String, Object?> toJson() => {
        NotesField.id: id,
        NotesField.title: title,
        NotesField.date: date,
        NotesField.startTime: startTime,
        NotesField.endTime: endTime,
        NotesField.remind: remind,
        NotesField.repeat: repeat,
        NotesField.taskColor: taskColor,
        NotesField.isCompleted: isCompleted,
      };
}
