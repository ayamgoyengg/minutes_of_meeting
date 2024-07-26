part of 'a_services.dart';

class LocalServiceDB {
  static final _databaseName = "localdbswantastic.db";
  static Database? _database;

  LocalServiceDB._privateConstructor();
  static final LocalServiceDB instance = LocalServiceDB._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
create table SearchTable (
  id_search integer primary key,
  title text
  )
''');
        await db.execute('''
create table DestinationTable ( 
  id_destination integer primary key, 
  name text,
  description text,
  picture text
  )
''');
      },
    );
  }

  // Future<DestinationData> insertDestination(DestinationData item) async {
  //   Database db = await instance.database;
  //   await db.rawInsert('INSERT INTO DestinationTable(id_destination, name, description, picture) VALUES("${item.idDestination}", "${item.name}", "${item.description}", "${item.picture}")');
  //   return item;
  // }

  // Future<int> deleteDestination(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete('DestinationTable', where: 'id_destination = ?', whereArgs: [id]);
  // }

  // Future<List<DestinationData>?> getAllDestination() async {
  //   Database db = await instance.database;
  //   List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM DestinationTable');
  //   List<DestinationData> dataListQuery = [];
  //   if (maps.isNotEmpty) {
  //     for (var element1 in maps) {
  //       dataListQuery.add(DestinationData.fromJson(element1));
  //     }
  //     return dataListQuery;
  //   }
  //   return [];
  // }

  // Future<void> insertSearch(String title) async {
  //   Database db = await instance.database;
  //   await db.rawInsert('INSERT INTO SearchTable(title) VALUES( "$title")');
  // }

  // Future<int> deleteSearch(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete('SearchTable', where: 'id_search = ?', whereArgs: [id]);
  // }

  // Future<List<SearchData>> getAllSearch() async {
  //   Database db = await instance.database;
  //   List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM SearchTable');
  //   List<SearchData> dataListQuery = [];
  //   if (maps.isNotEmpty) {
  //     for (var element1 in maps) {
  //       dataListQuery.add(SearchData.fromJson(element1));
  //     }
  //     return dataListQuery;
  //   }
  //   return [];
  // }

  // Future close() async {
  //   Database db = await instance.database;
  //   db.close();
  // }
}
