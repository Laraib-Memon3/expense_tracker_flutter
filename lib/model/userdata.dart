import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Userdata {
  Future<List<Map<String, dynamic>>> get dataList async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString('dataList');
    if (jsonData == null) {
      return [];
    }
    return List<Map<String, dynamic>>.from(json.decode(jsonData));
  }

  Future<void> setDataList(List<Map<String, dynamic>> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonData = json.encode(data);
    await prefs.setString('dataList', jsonData);
  }

  Future<void> ensureDataList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('dataList') == null ||
        prefs.getString('dataList')!.isEmpty) {
      final defaultData = [
        {
          'title': 'Upwork',
          'amount': 850.0,
          'date': 'Today',
          'imageUrl': 'assets/images/upwork.png'
        },
        {
          'title': 'Transfer',
          'amount': -85.0,
          'date': 'Yesterday',
          'imageUrl': 'assets/images/transfer.png'
        },
        {
          'title': 'Paypal',
          'amount': 1406.0,
          'date': 'Jan 30, 2022',
          'imageUrl': 'assets/images/paypal.png'
        },
        {
          'title': 'YouTube',
          'amount': -11.99,
          'date': 'Jan 16, 2022',
          'imageUrl': 'assets/images/youtube.png'
        },
      ];
      await setDataList(defaultData);
    }
  }
}
