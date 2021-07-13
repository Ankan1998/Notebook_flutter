import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutternote/models/note.dart';

class FireStore_srv {
  void add_fs(Note newnote) async {
    // save to db
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('note');

    var data = {
      'title': newnote.title,
      'des': newnote.description,
      'datetime': newnote.date,
      'priority': newnote.priority
    };

    ref.add(data);

    //
  }

  void add_log(Map<dynamic, dynamic> data) async {
    // save to db
    CollectionReference ref_log = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('logged');

    ref_log.add(data);

    //
  }

  void deleteReminder(DocumentReference ref) async {
    // delete from db
    await ref.delete();
  }

  void update(DocumentReference ref, Note note) async {
    await ref.update({
      'title': note.title,
      'des': note.description,
      'datetime': note.date,
      'priority': note.priority
    });
  }
}
