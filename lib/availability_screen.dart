import 'package:flutter/material.dart';
import 'google_sheets_api.dart';

class AvailabilityScreen extends StatefulWidget {
  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  List<Map<String, dynamic>> _data = [];
  final String spreadsheetId = '1aA5KTmiSwxxHOHrE6bd3oxTWCCh0QJdh';  // Your spreadsheet ID
  final String range = 'Sheet1!A1:F';  // Adjust the range as needed
  final String apiKey = 'YOUR_GOOGLE_API_KEY';  // Your API key

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await fetchGoogleSheet(spreadsheetId, range, apiKey);
      setState(() {
        _data = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Availability'),
      ),
      body: _data.isNotEmpty
          ? DataTable(
              columns: [
                DataColumn(label: Text('Sl No.')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('STP Capacity')),
                DataColumn(label: Text('Color')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Comments')),
              ],
              rows: _data
                  .map(
                    (row) => DataRow(
                      cells: [
                        DataCell(Text(row['slno'] ?? '')),
                        DataCell(Text(row['name'] ?? '')),
                        DataCell(Text(row['stp_capacity'] ?? '')),
                        DataCell(Text(row['color'] ?? '')),
                        DataCell(Text(row['location'] ?? '')),
                        DataCell(Text(row['comments'] ?? '')),
                      ],
                    ),
                  )
                  .toList(),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
