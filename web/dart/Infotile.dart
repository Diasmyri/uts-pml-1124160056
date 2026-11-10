import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Dias Mayri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Profile Mahasiswa'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info))],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Dias Mayri',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(height: 8),

                Text(
                  'NIM: 1124160056',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 8),

                Text(
                  'Program Studi Teknik Informatika',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 24),

                Card(
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'diasmayri15@gmail.com',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '08882007965218',
                      ),
                      InfoTile(
                        icon: Icons.school,
                        label: 'Kelas',
                        value: 'Teknik Informatika',
                      ),
                      InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: 'github.com/Diasmyri',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Card(
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.code,
                        label: 'Keahlian',
                        value: 'Frontend',
                      ),
                      InfoTile(
                        icon: Icons.web,
                        label: 'Keahlian',
                        value: 'Web Development',
                      ),
                      InfoTile(
                        icon: Icons.music_note,
                        label: 'Hobi',
                        value: 'Mendengarkan Musik',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
