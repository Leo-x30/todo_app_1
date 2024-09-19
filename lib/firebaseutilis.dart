import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/Model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> gettaskscollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
      fromFirestore: (snapshot, options) => Task.fromfirestore(snapshot.data()!),
      toFirestore: (task, options) => task.tofirestore(),
    );
  }

  static Future<void> addtasktofirestore(Task task) {
    var tasksCollection = gettaskscollection();
    var taskDocumentRef = tasksCollection.doc();
    task.id = taskDocumentRef.id;
    return taskDocumentRef.set(task);
  }

  static Future<void> updateTaskInFirestore(Task task) {
    return gettaskscollection().doc(task.id).update({
      'title': task.title,
      'description': task.description,
      'datetime': task.datetime.millisecondsSinceEpoch,
      'isDone': task.isDone,
    });
  }

  static Future<void> deleteTaskfromfireStore(Task task) {
    return gettaskscollection().doc(task.id).delete();
  }
}
