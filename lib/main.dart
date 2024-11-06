import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Towards Sustainable Solutions',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// LoginPage Widget


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _openWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open $url';
    }
  }

  void _login() {
    if (_usernameController.text == 'thanush' &&
        _passwordController.text == 'user') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sustainable Infra Development'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Logos section
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _openWebsite('https://kn.wikipedia.org/wiki/%E0%B2%B8%E0%B2%BF%E0%B2%A6%E0%B3%8D%E0%B2%A6%E0%B2%B0%E0%B2%BE%E0%B2%AE%E0%B2%AF%E0%B3%8D%E0%B2%AF'),
                    child: Image.asset('assets/image.png', height: 80, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _openWebsite('https://en-m-wikipedia-org.translate.goog/wiki/D._K._Shivakumar?_x_tr_sl=en&_x_tr_tl=kn&_x_tr_hl=kn&_x_tr_pto=tc'),
                        child: Image.asset('assets/dks.png', height: 80, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => _openWebsite('https://en-m-wikipedia-org.translate.goog/wiki/Eshwara_Khandre?_x_tr_sl=en&_x_tr_tl=kn&_x_tr_hl=kn&_x_tr_pto=wa'),
                        child: Image.asset('assets/eks.png', height: 80, fit: BoxFit.cover),  
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => _openWebsite('https://en.wikipedia.org/wiki/Government_of_Karnataka'),
                        child: Image.asset('assets/gok.png', height: 80, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => _openWebsite('https://kspcb.karnataka.gov.in/'),
                        child: Image.asset('assets/PCB.jpg', height: 80, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Login card
              Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sustainable Infra Development',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Icon Group Bangalore',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.teal,
                        ),
                        child: const Text('Login', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Sign-up text
              const Text(
                'Not yet registered? Sign up now',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HomePage Widget (after login)

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Towards Sustainable Solutions'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Image.asset('assets/image.png', fit: BoxFit.cover),
                Image.asset('assets/dks.png', fit: BoxFit.cover),
                Image.asset('assets/eks.png', fit: BoxFit.cover),
                Image.asset('assets/gok.png', fit: BoxFit.cover),
                Image.asset('assets/PCB.jpg', fit: BoxFit.cover),
              ],
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Links',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('KSPCB Initiatives'),
                    onTap: () => _launchURL('https://kspcb.karnataka.gov.in/'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Need For treating Seawage Water for Construction'),
                    onTap: () => _launchURL('https://indianexpress.com/article/cities/bangalore/treated-sewage-water-for-construction-karnataka-pollution-board-approaches-bis-to-fix-parameters-8140721/#:~:text=%2C%E2%80%9D%20he%20said.-,As%20part%20of%20discouraging%20the%20use%20of%20groundwater%20and%20water,construction%20purposes%20in%20the%20city./'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Benifits of Selling Treated Water'),
                    onTap: () => _launchURL('https://www.thehindu.com/news/cities/bangalore/water-woes-apartments-in-bengaluru-can-now-sell-50-of-treated-water-from-in-situ-stps/article67990318.ece'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Total Treatment of Treated Water'),
                    onTap: () => _launchURL('https://welllabs.org/bengalurus-decentralised-sewage-treatment-plants/'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TreatedWaterPage()),
                );
              },
              child: const Text('Use of Treated Water'),
            ),
          ],
        ),
      ),
    );
  }
}

// TreatedWaterPage Widget

class TreatedWaterPage extends StatelessWidget {
  const TreatedWaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Use of Treated Water'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BlankPage(title: 'Legislative')),
                );
              },
              child: const Text('Legislative'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AvailabilityPage()),
                );
              },
              child: const Text('Availability'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NeedForWaterPage()),
                );
              },
              child: const Text('Need For Water'),
            ),
          ],
        ),
      ),
    );
  }
}

// BlankPage Widget

class BlankPage extends StatelessWidget {
  final String title;
  const BlankPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title page')),
    );
  }
}

// AvailabilityPage Widget


Future<List<Map<String, dynamic>>> readExcelFile() async {
  final bytes = await rootBundle.load('assets/Ava');
  final excel = Excel.decodeBytes(bytes.buffer.asUint8List());
  final sheet = excel.tables['Sheet1']; // Ensure the data is in the correct sheet

  List<Map<String, dynamic>> data = [];

  if (sheet != null) {
    for (var row in sheet.rows) {
      if (row.isNotEmpty) {
        Map<String, dynamic> rowData = {
          'slno': row[0]?.value ?? '',
          'name': row[1]?.value ?? '',
          'stp_capacity': row[2]?.value ?? '',
          'color': row[3]?.value ?? '',
          'location': row[4]?.value ?? '',
          'comments': row[5]?.value ?? '',
        };
        data.add(rowData);
      }
    }
  }

  return data;
}

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({super.key});

  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  List<Map<String, dynamic>> _data = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await readExcelFile();
      setState(() {
        _data = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Availability'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _data.isNotEmpty
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Sl No.')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('STP Capacity')),
                      DataColumn(label: Text('Color')),
                      DataColumn(label: Text('Location')),
                      DataColumn(label: Text('Comments')),
                    ],
                    rows: _data.map((row) {
                      return DataRow(
                        cells: [
                          DataCell(Text(row['slno'].toString())),
                          DataCell(Text(row['name'].toString())),
                          DataCell(Text(row['stp_capacity'].toString())),
                          DataCell(Text(row['color'].toString())),
                          DataCell(Text(row['location'].toString())),
                          DataCell(Text(row['comments'].toString())),
                        ],
                      );
                    }).toList(),
                  ),
                )
              : const Center(child: Text('No data available')),
    );
  }
}
class NeedForWaterPage extends StatelessWidget {
  const NeedForWaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Need for Treated Water'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Project X - 5 KLD'),
            subtitle: Text('Distance: 5 km'),
          ),
          ListTile(
            title: Text('Project Y - 10 KLD'),
            subtitle: Text('Distance: 10 km'),
          ),
          ListTile(
            title: Text('Project Z - 15 KLD'),
            subtitle: Text('Distance: 8 km'),
          ),
        ],
      ),
    );
  }
}

