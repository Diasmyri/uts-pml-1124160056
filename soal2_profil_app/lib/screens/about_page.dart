import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String nama;
  final String foto;

  const AboutPage({super.key, required this.nama, required this.foto});

  final List<String> skills = const [
    'Flutter Development',
    'HTML dan CSS',
    'Pemrograman Dart',
  ];

  final List<String> hobbies = const [
    'Mendengarkan Musik',
    'Belajar Teknologi',
    'Bermain Game',
    'Bermain Futsal',
  ];

  final List<Map<String, String>> pendidikan = const [
    {
      'jenjang': 'Perguruan Tinggi',
      'nama': 'Global Institute',
      'tahun': 'Sedang Menempuh Pendidikan',
    },
    {
      'jenjang': 'SMK',
      'nama': 'SMK Negeri 2 Kabupaten Tangerang',
      'tahun': '2018-2021',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(radius: 60, backgroundImage: AssetImage(foto)),
          ),

          const SizedBox(height: 16),

          Center(
            child: Text(
              nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Tentang Saya',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Saya adalah mahasiswa yang tertarik dengan '
            'pengembangan aplikasi mobile dan teknologi.',
          ),

          const SizedBox(height: 24),

          const Text(
            'Keahlian (Skills)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          ...skills.map(
            (skill) => Card(
              child: ListTile(
                leading: const Icon(Icons.code, color: Colors.blueAccent),
                title: Text(skill),
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Hobi dan Minat',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          ...hobbies.map(
            (hobby) => Card(
              child: ListTile(
                leading: const Icon(Icons.favorite, color: Colors.pink),
                title: Text(hobby),
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          ...pendidikan.map(
            (item) => Card(
              child: ListTile(
                leading: const Icon(Icons.school, color: Colors.blueAccent),
                title: Text(item['jenjang']!),
                subtitle: Text('${item['nama']}\n${item['tahun']}'),
                isThreeLine: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
