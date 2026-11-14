import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final Profile profile = Profile(
    nama: 'Dias Mayri',
    nim: '1124160056',
    programStudi: 'Teknik Informatika',
    kelas: 'TI24PSE3',
    email: 'diasmayri15@gmail.com',
    nomorHp: '0882007965218',
    github: 'github.com/Diasmyri',
    foto: 'assets/images/foto_dias.jpeg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Mahasiswa'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueAccent,
              child: profile.foto.isNotEmpty
                  ? ClipOval(
                      child: Image.asset(
                        profile.foto,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(Icons.person, size: 70, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              profile.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Mahasiswa',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  buildInfoTile(Icons.badge, 'NIM', profile.nim),
                  buildInfoTile(
                    Icons.school,
                    'Program Studi',
                    profile.programStudi,
                  ),
                  buildInfoTile(Icons.class_, 'Kelas', profile.kelas),
                  buildInfoTile(Icons.email, 'Email', profile.email),
                  buildInfoTile(Icons.phone, 'Nomor HP', profile.nomorHp),
                  buildInfoTile(Icons.code, 'GitHub', profile.github),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
