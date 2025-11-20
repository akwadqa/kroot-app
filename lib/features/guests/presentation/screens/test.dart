import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  Future<void> pickAndReadFile() async {
    // اختيار الملف
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
    );

    if (result == null) {
      print("❌ لم يتم اختيار أي ملف");
      return;
    }

    final file = result.files.single;
    final path = file.path!;
    final extension = path.split('.').last.toLowerCase();

    Map<String, int> columnIndex = {}; // لتحديد أعمدة first_name و last_name
    List<List<dynamic>> rows = []; // الصفوف المقروءة

    // ============================
    // قراءة ملف Excel
    // ============================
    if (extension == 'xlsx') {
      print("📘 قراءة ملف Excel ...");

      final bytes = File(path).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);

      final sheet = excel.tables.values.first;
      for (var row in sheet!.rows) {
        rows.add(row.map((cell) => cell?.value).toList());
      }
    }
    // ============================
    // قراءة ملف CSV
    // ============================
    else if (extension == 'csv') {
      print("📄 قراءة ملف CSV ...");

      final fileContent = File(path).readAsStringSync();
      rows = const CsvToListConverter().convert(fileContent);
    } else {
      print("⚠️ نوع الملف غير مدعوم");
      return;
    }

    // ============================
    // التحقق من وجود الأعمدة المطلوبة
    // ============================
    if (rows.isEmpty) {
      print("⚠️ الملف فارغ");
      return;
    }

    // تنظيف أسماء الأعمدة للتأكد من المقارنة
    List<String> cleanHeader = rows.first.map((e) {
      return e.toString().trim().toLowerCase().replaceAll(
        RegExp(r'[\ufeff\s]'),
        '',
      );
    }).toList();

    const requiredColumns = ['first_name', 'last_name'];

    for (var col in requiredColumns) {
      if (!cleanHeader.contains(col)) {
        print("❌ خطأ: يجب أن يحتوي الملف على العمود '$col'");
        return;
      }
    }

    print("✅ الأعمدة المطلوبة موجودة");

    columnIndex['first_name'] = cleanHeader.indexOf('first_name');
    columnIndex['last_name'] = cleanHeader.indexOf('last_name');

    // ============================
    // قراءة البيانات بعد التأكد
    // ============================
    print("📋 البيانات:");

    for (int i = 1; i < rows.length; i++) {
      final row = rows[i];

      final firstName = row[columnIndex['first_name']!];
      final lastName = row[columnIndex['last_name']!];

      print(" - $firstName $lastName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // final pickedFile = await FilePicker.platform.pickFiles();
            // print(pickedFile?.paths);
            pickAndReadFile();
          },
          child: Text('pres'),
        ),
      ),
    );
  }
}
