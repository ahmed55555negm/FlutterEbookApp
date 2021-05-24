import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

class FavoriteDB {
  getPath() async {
    /// where the application may access top level storage.
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = documentDirectory.path + '/favorites.db';
    return path;
  }

  //Insertion
  add(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    db.insert(item);
    await db.close();
  }

  Future<int> remove(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    int val =
        await db.remove(item); //TODO:why ineed the return value here (val)
    await db.close();
    return val; //why using val
  }

  Future<List> listAll() async {
    final db = ObjectDB(await getPath());
    db.open();
    List val = await db.find(
        {}); // TODO: //what the value will return in val???//ithivk this (find)get all data here
    await db.close();
    return val;
  }

  Future<List> check(Map item) async {
    //ithink this for searching
    final db = ObjectDB(await getPath());
    db.open();
    List val = await db.find(item);
    await db.close();
    return val;
  }
}
