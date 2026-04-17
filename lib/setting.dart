import 'package:flutter/material.dart';
import 'main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.deepPurple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Icon(
                  themeNotifier.value == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.deepPurple,
                ),
                title: const Text("Dark Mode", style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Switch(
                  value: themeNotifier.value == ThemeMode.dark,
                  onChanged: (value) {
                    setState(() {
                      themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
