import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchGoogleSheet(
    String spreadsheetId, String range, String apiKey) async {
  final url =
      'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final List<Map<String, dynamic>> data = [];
    final headers = json['values'][0];

    for (var row in json['values'].skip(1)) {
      final rowData = <String, String>{};
      for (var i = 0; i < headers.length; i++) {
        rowData[headers[i]] = row[i];
      }
      data.add(rowData);
    }
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
