import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController programStudiController;
  late TextEditingController kelasController;
  late TextEditingController emailController;
  late TextEditingController nomorHpController;
  late TextEditingController githubController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(text: widget.profile.nama);
    nimController = TextEditingController(text: widget.profile.nim);
    programStudiController = TextEditingController(
      text: widget.profile.programStudi,
    );
    kelasController = TextEditingController(text: widget.profile.kelas);
    emailController = TextEditingController(text: widget.profile.email);
    nomorHpController = TextEditingController(text: widget.profile.nomorHp);
    githubController = TextEditingController(text: widget.profile.github);
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    programStudiController.dispose();
    kelasController.dispose();
    emailController.dispose();
    nomorHpController.dispose();
    githubController.dispose();
    super.dispose();
  }

  void simpanProfil() {
    if (formKey.currentState!.validate()) {
      final dataBaru = Profile(
        nama: namaController.text,
        nim: nimController.text,
        programStudi: programStudiController.text,
        kelas: kelasController.text,
        email: emailController.text,
        nomorHp: nomorHpController.text,
        github: githubController.text,
        foto: widget.profile.foto,
      );

      Navigator.pop(context, dataBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildField('Nama', namaController),
              buildField('NIM', nimController),
              buildField('Program Studi', programStudiController),
              buildField('Kelas', kelasController),
              buildField(
                'Email',
                emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              buildField(
                'Nomor HP',
                nomorHpController,
                keyboardType: TextInputType.phone,
              ),
              buildField('GitHub', githubController),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: simpanProfil,
                  child: const Text('Simpan Perubahan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label tidak boleh kosong';
          }

          if (label == 'Email' &&
              (!value.contains('@') || !value.contains('.'))) {
            return 'Format email tidak valid';
          }

          return null;
        },
      ),
    );
  }
}
