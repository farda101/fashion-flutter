import 'package:fashion_lens/main.dart';
import 'package:fashion_lens/views/constants/avatar.dart';
import 'package:fashion_lens/views/constants/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 1;

  final _usernameController = TextEditingController();
  final _jkController = TextEditingController();
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _getInitialProfile();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _jkController.dispose();
    super.dispose();
  }

  // Future<void> _getInitialProfile() async {
  //   final userId = supabase.auth.currentUser!.id;
  //   final data =
  //       await supabase.from('profiles').select().eq('id', userId).single();
  //   setState(() {
  //     _usernameController.text = data['username'] ?? '';
  //     _jkController.text = data['jenis_kelamin'] ?? '';
  //     _imageUrl = data['avatar_url'];
  //   });
  // }
  Future<void> _getInitialProfile() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final userId = user.id;
      final data =
          await supabase.from('profiles').select().eq('id', userId).single();
      setState(() {
        _usernameController.text = data['username'] ?? '';
        _jkController.text = data['jenis_kelamin'] ?? '';
        _imageUrl = data['avatar_url'];
      });
    }
  }

  void _logout(BuildContext context) async {
    final supabase = Supabase.instance.client;

    try {
      await supabase.auth.signOut();

      Navigator.of(context).pushReplacementNamed('/signin');
    } catch (error) {
      print('Cek Logout error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFC6AC),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8),
            Text(
              'Fashion Lens',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Avatar(
              imageUrl: _imageUrl,
              onUpload: (imageUrl) async {
                setState(() {
                  _imageUrl = imageUrl;
                });
                final userId = supabase.auth.currentUser!.id;
                await supabase
                    .from('profiles')
                    .update({'avatar_url': imageUrl}).eq('id', userId);
              }),
          const SizedBox(height: 12),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              label: Text('Username'),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _jkController,
            decoration: const InputDecoration(
              label: Text('Jenis Kelamin'),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () async {
              final username = _usernameController.text.trim();
              final jk = _jkController.text.trim();
              final userId = supabase.auth.currentUser!.id;

              await supabase.from('profiles').update({
                'username': username,
                'jenis_kelamin': jk,
              }).eq('id', userId);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Your data has been saved')));
              }
            },
            child: const Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {
              _logout(context);
            },
            child: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/homepage');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/profile');
                break;
            }
          });
        },
      ),
    );
  }
}
