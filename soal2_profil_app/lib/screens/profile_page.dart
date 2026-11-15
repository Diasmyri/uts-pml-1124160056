import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

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
            onPressed: widget.onThemeChanged,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Ganti Tema',
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                'Aplikasi Profil Mahasiswa',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AboutPage(nama: profile.nama, foto: profile.foto),
                  ),
                );
              },
            ),
          ],
        ),
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
                  InfoTile(icon: Icons.badge, title: 'NIM', value: profile.nim),
                  InfoTile(
                    icon: Icons.school,
                    title: 'Program Studi',
                    value: profile.programStudi,
                  ),
                  InfoTile(
                    icon: Icons.class_,
                    title: 'Kelas',
                    value: profile.kelas,
                  ),
                  InfoTile(
                    icon: Icons.email,
                    title: 'Email',
                    value: profile.email,
                  ),
                  InfoTile(
                    icon: Icons.phone,
                    title: 'Nomor HP',
                    value: profile.nomorHp,
                  ),
                  InfoTile(
                    icon: Icons.code,
                    title: 'GitHub',
                    value: profile.github,
                  ),
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AboutPage(nama: profile.nama, foto: profile.foto),
              ),
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: editProfil,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
