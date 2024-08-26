class Task{
  static const String collectionName ='tasks';
  String id;
  String title;
  String description;
  DateTime datetime;
  bool isDone;

  Task({this.id='',required this.title,required this.datetime,
    required this.description ,this.isDone=false});

  Task.fromfirestore(Map<String,dynamic>data):this(
    id: data['id']as String,
    title: data['title'],
    datetime: DateTime.fromMillisecondsSinceEpoch(data['datetime']),
    description: data['description'],
    isDone: data['isdone'] as bool
  );

  Map <String,dynamic> tofirestore(){
    return{
      'id': id ,
      'title': title,
      'description': description,
      'datetime' : datetime.millisecondsSinceEpoch,
      'isdone' :isDone
    };
  }
}