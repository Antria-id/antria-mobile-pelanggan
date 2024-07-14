import 'dart:async';
import 'dart:convert';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'antria.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
            CREATE TABLE product (
              id INTEGER PRIMARY KEY,
              nama_produk TEXT,
              deskripsi_produk TEXT,
              harga INTEGER,
              gambar TEXT,
              kuantitas INTEGER,
              mitraId INTEGER,
              created_at TEXT,
              updated_at TEXT
            )
          ''');
      await db.execute('''
          CREATE TABLE orderList (
            id INTEGER PRIMARY KEY,
            product_id INTEGER,
            pesanan_id STRING,
            quantity INTEGER,
            created_at DATE,
            updated_at DATE
          )
      ''');
      await db.execute('''
          CREATE TABLE pesanan (
            invoice STRING PRIMARY KEY,
            payment STRING,
            pemesanan STRING,
            takeaway BOOLEAN,
            oderList STRING, 
            status STRING,
            pelanggan_id INTEGER,
            mitra_id INTEGER,
            created_at DATE,
            updated_at DATE
          )
      ''');
    });
  }

  List<int> orderId = [];

  Future<List<Map<String, dynamic>>> getMenuRestaurant() async {
    final db = await instance.database;
    return await db.query('product');
  }

  Future<void> insertProduct(GetMenuResponse product) async {
    final db = await instance.database;
    await db.insert(
      'product',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> addPesanan(
    String invoice,
    String payment,
    String pemesanan,
    bool takeaway,
    String status,
    int pelangganId,
    int mitraId,
    DateTime createdAt,
    DateTime updatedAt,
  ) async {
    final db = await instance.database;
    await db.insert(
      'pesanan',
      {
        'invoice': invoice,
        'payment': payment,
        'pemesanan': pemesanan,
        'takeaway': takeaway,
        'status': status,
        'pelanggan_id': pelangganId,
        'mitra_id': mitraId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> addOrderList(
    int productId,
    int quantity,
    DateTime createdAt,
    DateTime updatedAt,
  ) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> existingOrders = await db.query(
      'orderList',
      where: 'product_id = ?',
      whereArgs: [productId],
    );

    if (existingOrders.isNotEmpty) {
      final int existingQuantity = existingOrders.first['quantity'];
      await db.update(
        'orderList',
        {
          'quantity': existingQuantity + quantity,
          'updated_at': updatedAt.toIso8601String(),
        },
        where: 'product_id = ?',
        whereArgs: [productId],
      );
    } else {
      // Insert new product into orderList
      await db.insert(
        'orderList',
        {
          'product_id': productId,
          'quantity': quantity,
          'created_at': createdAt.toIso8601String(),
          'updated_at': updatedAt.toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> incrementOrderQuantity(int productId, int quantity) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> existingOrders = await db.query(
      'orderList',
      where: 'product_id = ?',
      whereArgs: [productId],
    );

    if (existingOrders.isNotEmpty) {
      final int existingQuantity = existingOrders.first['quantity'];
      await db.update(
        'orderList',
        {
          'quantity': existingQuantity + 1,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'product_id = ?',
        whereArgs: [productId],
      );
    }
  }

  Future<void> decrementOrderQuantity(int productId, int quantity) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> existingOrders = await db.query(
      'orderList',
      where: 'product_id = ?',
      whereArgs: [productId],
    );

    if (existingOrders.isNotEmpty) {
      final int existingQuantity = existingOrders.first['quantity'];
      final int newQuantity = existingQuantity - 1;
      if (newQuantity > 0) {
        await db.update(
          'orderList',
          {
            'quantity': newQuantity,
            'updated_at': DateTime.now().toIso8601String(),
          },
          where: 'product_id = ?',
          whereArgs: [productId],
        );
      } else {
        await db.delete(
          'orderList',
          where: 'product_id = ?',
          whereArgs: [productId],
        );
      }
    }
  }

  Future<List<Map<String, dynamic>>> getOrderList() async {
    final db = await instance.database;
    return await db.query('orderList');
  }

  Future<List<Map<String, dynamic>>> getProductsInOrderList() async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> result = await db.rawQuery('''
    SELECT product.id, product.nama_produk, product.harga, product.gambar, orderList.quantity
    FROM orderList
    JOIN product ON orderList.product_id = product.id
  ''');
    return result;
  }

  Future<void> insertPesanan(String invoice, String payment, int pelangganId,
      String pemesanan, bool takeaway, int mitraId) async {
    final db = await instance.database;

    for (int id in orderId) {
      await updatePesananId(invoice, id);
    }

    final List<Map<String, dynamic>> orderList = await getOrderList();
    String orderListJson =
        orderList.map((order) => order.toString()).toList().toString();

    List<Map<String, dynamic>> mappedOrderList = orderList.map((order) {
      return {
        'quantity': order['quantity'],
        'produkId': order['product_id'],
      };
    }).toList();

    await db.insert(
      'pesanan',
      {
        'invoice': invoice,
        'payment': payment,
        'pemesanan': pemesanan,
        'takeaway': takeaway,
        'oderList': orderListJson,
        'status': 'SUCCESS',
        'pelanggan_id': pelangganId,
        'mitra_id': mitraId,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    Map<String, dynamic> payload = {
      'pesanan': {
        'invoice': invoice,
        'payment': payment,
        'status': 'SUCCESS',
        'pemesanan': pemesanan,
        'takeaway': takeaway,
        'pelangganId': pelangganId,
        'mitraId': mitraId,
      },
      'order_lists': mappedOrderList,
    };

    String jsonPayload = json.encode(payload);

    print('Response payload $jsonPayload');

    final Request request = serviceLocator<Request>();
    try {
      final response = await request.post(
        APIUrl.insertPesanan,
        data: jsonPayload,
      );

      if (response.statusCode == 201) {
        print('Pesanan inserted successfully');
      } else {
        print(
            'Failed to insert Pesanan. Error ${response.statusCode}: ${response.data}');
      }
    } catch (e) {
      print('Error inserting Pesanan: $e');
    }

    await db.delete(
      'orderList',
    );
  }

  Future<void> updatePesananId(String pesananId, int id) async {
    final db = await instance.database;
    await db.update(
      'orderList',
      {
        'pesanan_id': pesananId,
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllProducts() async {
    final db = await instance.database;

    await db.delete('product');

    await db.delete('orderList');
  }
}
