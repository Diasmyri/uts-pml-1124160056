import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profile;

  @override
  void initState() {
    super.initState();

    profile = Profile(
      nama: 'Dias Mayri',
      nim: '1124160056',
      programStudi: 'Teknik Informatika',
      kelas: 'TI24PSE3',
      email: 'diasmayri15@gmail.com',
      nomorHp: '0882007965218',
      github: 'github.com/Diasmyri',
      foto: 'assets/images/foto_dias.jpeg',
    );
  }

  Future<void> editProfil() async {
    final dataBaru = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: profile),
      ),
    );

    if (dataBaru != null) {
      setState(() {
        profile = dataBaru;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: editProfil,
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueAccent,
              backgroundImage: profile.foto.isNotEmpty
                  ? AssetImage(profile.foto)
                  : null,
              child: profile.foto.isEmpty
                  ? const Icon(Icons.person, size: 70, color: Colors.white)
                  : null,
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
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: editProfil,
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil'),
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
