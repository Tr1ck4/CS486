import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:cinema/object.dart';
import 'dart:async';
import 'dart:io' as io;
class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('coffeeshop.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: onCreate);
  }
  Future onCreate(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
     await db.execute('''
      CREATE TABLE Client(
        ${ClientField.name}     $textType, 
        ${ClientField.phone}    $integerType,
        ${ClientField.email}    $textType,
        ${ClientField.loyalty}  $integerType, 
        ${ClientField.points}   $integerType,
        PRIMARY KEY(${ClientField.name},${ClientField.phone},${ClientField.email})
      )
     ''');
     await db.execute('''
      CREATE TABLE Cart(
        ${CartField.name}     $textType, 
        ${CartField.phone}    $integerType,
        ${CartField.email}    $textType,
        ${CartField.isDone}   $boolType, 
        ${CartField.id}       $idType,
        FOREIGN KEY (${CartField.name} ,${CartField.phone},${CartField.email}) REFERENCES Client(${ClientField.name},${ClientField.phone},${ClientField.email})
      )
     ''');
     await db.execute('''
      CREATE TABLE Contains(
        ${ContainsField.name}  $textType,
        ${ContainsField.id}    $idType,
        ${ContainsField.type}  $integerType,
        FOREIGN KEY (${ContainsField.name},${ContainsField.id},${ContainsField.type}) REFERENCES Coffee(${DrinksField.name},${DrinksField.type},${DrinksField.price})
      )
     ''');
     await db.execute('''
      CREATE TABLE Coffee(
        ${DrinksField.name}   $textType,
        ${DrinksField.type}   $integerType,
        ${DrinksField.price}  $integerType,
        PRIMARY KEY (${DrinksField.name},${DrinksField.type},${DrinksField.price}) 
      )
     ''');
  }
  Future<Client> readClient(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'Client',
      columns: ClientField.values,
      where: '${ClientField.name} = ?',
      whereArgs: [],
    );

    if (maps.isNotEmpty) {
      return Client.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<void> addClient(Client client) async{
    final db = await instance.database;
    await db.insert("Client", client.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<void> updateClient(Client client)async{
    final db = await instance.database;
    await db.update("Client",
        client.toJson(),where: 'Name = ?,Phone = ?, Email = ?',
        whereArgs: [client.name,client.phone,client.email]);
  }
  Future<void> deleteClient(Client client)async{
    final db = await instance.database;
    await db.delete("Client",
        where: 'Name = ?,Phone = ?, Email = ?',
        whereArgs: [client.name,client.phone,client.email]);
  }
  static Future<List<Client>?> getallClient()async{
    final db = await instance.database;
    final List<Map<String,dynamic>> maps = await db.query("Client");
    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => Client.fromJson(maps[index]));
  }

  /*static Future<int> addCart(Cart cart) async{
    final db = await instance.database;
    return await db.insert("Cart", cart.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> updateCart(Cart cart)async{
    final db = await instance.database;
    return await db.update("Cart",
        cart.toJson(),where: 'ID = ?',
        whereArgs: [cart.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> deleteCart(Cart cart)async{
    final db = await instance.database;
    return await db.delete("Cart",
        where: 'ID = ?',
        whereArgs: [cart.id]);
  }
  static Future<List<Cart>?> getallCart()async{
    final db = await instance.database;
    final List<Map<String,dynamic>> maps = await db.query("Cart");
    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => Cart.fromJson(maps[index]));
  }

  static Future<int> addContains(Contains contains) async{
    final db = await instance.database;
    return await db.insert("Cart", contains.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> updateContains(Contains contains)async{
    final db = await instance.database;
    return await db.update("Cart",
        contains.toJson(),where: 'ID = ?, Name = ?, Type = ?',
        whereArgs: [contains.id,contains.name,contains.type],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> deleteContains(Contains contains)async{
    final db = await instance.database;
    return await db.delete("Contains",
        where: 'ID = ?, Name = ?, Type = ?',
        whereArgs: [contains.id,contains.name,contains.type]);
  }
  static Future<List<Contains>?> getallContains()async{
    final db = await instance.database;
    final List<Map<String,dynamic>> maps = await db.query("Contains");
    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => Contains.fromJson(maps[index]));
  }

  static Future<int> addDrikns(Drinks drinks) async{
    final db = await instance.database;
    return await db.insert("Drinks", drinks.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> updateDrinks(Drinks drinks)async{
    final db = await instance.database;
    return await db.update("Drinks",
        drinks.toJson(),where: 'price = ?, Name = ?, Type = ?',
        whereArgs: [drinks.price,drinks.name,drinks.type],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> deleteDrinks(Drinks drinks)async{
    final db = await instance.database;
    return await db.delete("Cart",
        where: 'ID = ?, Name = ?, Type = ?',
        whereArgs: [drinks.price,drinks.name,drinks.type]);
  }
  static Future<List<Drinks>?> getallDrinks()async{
    final db = await instance.database;
    final List<Map<String,dynamic>> maps = await db.query("Drinks");
    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => Drinks.fromJson(maps[index]));
  }*/

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}