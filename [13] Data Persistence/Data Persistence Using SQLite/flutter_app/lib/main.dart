import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database
    final Database db = await database;

    // Insert the Dog into the correct table. We will also specify the
    // `conflictAlgorithm` to use in this case. If the same dog is inserted
    // multiple times, it will replace the previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs() async {
    // Get a reference to the database
    final Database db = await database;

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database
    final db = await database;

    // Update the given Dog
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure we only update the Dog with a matching id
      where: "id = ?",
      // Pass the Dog's id through as a whereArg to prevent SQL injection
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database
    final db = await database;

    // Remove the Dog from the Database
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog
      where: "id = ?",
      // Pass the Dog's id through as a whereArg to prevent SQL injection
      whereArgs: [id],
    );
  }

  var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );

  // Insert a dog into the database
  await insertDog(fido);

  // Print the list of dogs (only Fido for now)
  print(await dogs());

  // Update Fido's age and save it to the database
  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );
  await updateDog(fido);

  // Print Fido's updated information
  print(await dogs());

  // Delete Fido from the Database
  await deleteDog(fido.id);

  // Print the list of dogs (empty)
  print(await dogs());
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about each dog when
  // using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}