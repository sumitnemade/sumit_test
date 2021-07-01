import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sumit_test/models/slot.dart';

class DatabaseHelper {
  static final slotsTable = 'slots_table';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), "syncDataTest90.db");
    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $slotsTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            slot_start TEXT,
            slot_end TEXT,
            name TEXT,
            last_name TEXT,
            phone INTEGER
          )
          ''');
  }

  Future<List<Slot>> queryAllSlots() async {
    List<Slot> mList = [];
    Database db = await DatabaseHelper.instance.database;
    try {
      List<Map<String?, dynamic>> cList = await db.rawQuery(
        'SELECT * FROM ${DatabaseHelper.slotsTable}',
      );
      if (cList.isNotEmpty)
        mList = cList.map((e) => Slot.fromJson(e)).toList();
      else {
        await insert(Slot(slot_start: "9AM", slot_end: "10AM"));
        mList.add(Slot(slot_start: "9AM", slot_end: "10AM"));

        await insert(Slot(slot_start: "10AM", slot_end: "11AM"));
        mList.add(Slot(slot_start: "10AM", slot_end: "11AM"));

        await insert(Slot(slot_start: "11AM", slot_end: "12PM"));
        mList.add(Slot(slot_start: "11AM", slot_end: "12PM"));

        await insert(Slot(slot_start: "12PM", slot_end: "1PM"));
        mList.add(Slot(slot_start: "12PM", slot_end: "1PM"));

        await insert(Slot(slot_start: "1PM", slot_end: "2PM"));
        mList.add(Slot(slot_start: "1PM", slot_end: "2PM"));

        await insert(Slot(slot_start: "2PM", slot_end: "3PM"));
        mList.add(Slot(slot_start: "2PM", slot_end: "3PM"));

        await insert(Slot(slot_start: "3PM", slot_end: "4PM"));
        mList.add(Slot(slot_start: "3PM", slot_end: "4PM"));

        await insert(Slot(slot_start: "4PM", slot_end: "5PM"));
        mList.add(Slot(slot_start: "4PM", slot_end: "5PM"));
      }
    } catch (e) {
      print(e);
    }
    return mList;
  }

  Future<int> insert(Slot? slot) async {
    Database db = await instance.database;
    return await db.insert(slotsTable, slot!.toDbMap());
  }
//

//
// Future<bool> checkCountryDataExists() async {
//   Database db = await instance.database;
//
//   int? count = Sqflite.firstIntValue(
//       await db.rawQuery('SELECT COUNT(*) FROM $maCountry'));
//
//   if (count != null && count > 0) return true;
//   return false;
// }

  Future<int> update(Slot? slot) async {
    Database db = await instance.database;
    int? id = slot!.id;
    return await db
        .update(slotsTable, slot.toDbMap(), where: 'id = ?', whereArgs: [id]);
  }

// Future<int> deleteCountries() async {
//   Database db = await instance.database;
//   return await db.delete(maCountry);
// }

// Future<int> deleteCountries(int id) async {
//   Database db = await instance.database;
//   return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
// }
}
